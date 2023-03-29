import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/screens/sharedprefference.dart';
import 'package:todo_app/widget/app_color.dart';
import 'package:todo_app/widget/auth/customtextform.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _rememberMe = false;
  late String email, password;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: AppColors.mainColor,
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
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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

                // const SizedBox(
                //   height: 10,
                // ),
                CheckboxListTile(
                  title: Text("Remember me"),
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have\'t An Account?',
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
                        'SignUp Here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.boldtextColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('signupscreen');
                      },
                    ),
                  ],
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
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        _performLogin();
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(width: 10),
                    Text(
                      "---------   OR   ---------",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.google,
                        size: 40,
                        color: Colors.red.withRed(200),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        size: 40,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _performLogin() {
    if (_checkData()) {
      _login();
    } else {
      showSnackBar(message: 'invalid login');
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailController.text)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  _login() async {
    // SharedPrefController shared = SharedPrefController();
    // await shared.getInit();
    SharedPrefController().setData(key: PrefKeys.isLogin.name, value: true);
    SharedPrefController()
        .setData(key: PrefKeys.email.name, value: _emailController.text);
    SharedPrefController()
        .setData(key: PrefKeys.password.name, value: _passwordController.text);

    Navigator.pushNamed(context, 'myhomescreen');
  }

  showSnackBar({message, error}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      //  error ? Colors.red : Colors.green,
    ));
  }
}
