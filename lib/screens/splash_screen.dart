import 'package:flutter/material.dart';
import 'package:todo_app/screens/sharedprefference.dart';
import 'package:todo_app/screens/test.dart';

import 'testform.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to simulate loading time
    Future.delayed(const Duration(seconds: 2), () {
      bool? flag =
          SharedPrefController().getData(key: PrefKeys.isLogin.name) ?? false;
      String routes = flag ? 'myhomescreen' : 'signinscreen';
      Navigator.pushReplacementNamed(context, routes);
    });

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) =>  MyHomePage(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              ' To Do',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
