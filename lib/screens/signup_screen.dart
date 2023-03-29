import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screens/sharedprefference.dart';
import 'package:todo_app/widget/app_color.dart';

import '../model/user.dart';
import '../widget/auth/customtextform.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
  }

  bool _rememberMe = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadRememberMe();
  // }

  // Future<void> _loadRememberMe() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _rememberMe = prefs.getBool("rememberMe") ?? false;
  //     if (_rememberMe) {
  //       _emailController.text = prefs.getString("email")!;
  //       _passwordController.text = prefs.getString("password")!;
  //     }
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  late String email, password, name, mobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black87,
                  ), // TextStyle
                  // Text
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/login.png',
                    width: 150,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextForm(
                        hintext: 'Enter Your Name',
                        labeltext: 'Name',
                        iconData: Icons.person_outline_outlined,
                        mycontroller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   setState(() {
                        //     name = value!;
                        //   });
                        // },
                        keyboardType: TextInputType.name,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextForm(
                        hintext: 'Enter Your Email',
                        labeltext: 'Email',
                        iconData: Icons.email_outlined,
                        mycontroller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   setState(() {
                        //     email = value!;
                        //   });
                        // },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextForm(
                        hintext: 'Enter Your Mobile Number',
                        labeltext: 'Mobile',
                        iconData: Icons.call_outlined,
                        mycontroller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   setState(() {
                        //     mobile = value!;
                        //   });
                        // },
                        keyboardType: TextInputType.number,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextForm(
                        hintext: 'Enter Your Password',
                        labeltext: 'Password',
                        iconData: Icons.lock_outline,
                        mycontroller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   setState(() {
                        //     password = value!;
                        //   });
                        // },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade800,
                      fixedSize: const Size(260, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async => await _performRegister(),

                    // if (_formKey.currentState!.validate()) {
                    //   if (_rememberMe) {
                    //     final prefs = await SharedPreferences.getInstance();
                    //     prefs.setString("email", _emailController.text);
                    //     prefs.setString("password", _passwordController.text);
                    //     prefs.setBool("rememberMe", _rememberMe);
                    //   }
                    //   Navigator.pushNamed(context, 'myhomescreen');
                    // }
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have An Account?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Text(
                        'SignIn Here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.boldtextColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('signinscreen');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_formKey.currentState!.validate()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _register() async {
    SharedPrefController().saveUser(user: user);
    Navigator.of(context).pushNamed('myhomescreen');
  }

  User get user {
    User user = User();
    user.name = _nameController.text;
    user.email = _emailController.text;
    user.password = _passwordController.text;
    return user;
  }
}
