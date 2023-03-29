import 'package:flutter/material.dart';
import 'package:todo_app/database/userdatabase.dart';
import 'package:todo_app/screens/addnotes.dart';
import 'package:todo_app/screens/setting_screen.dart';
import 'package:todo_app/screens/sharedprefference.dart';

import 'screens/Home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().getInit();
  await DBController().initDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade600),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // home: const SplashScreen(),
      routes: {
        '/': (context) => const SplashScreen(),
        'signinscreen': (context) => const SignInScreen(),
        'signupscreen': (context) => const SignUpScreen(),
        'myhomescreen': (context) => const MyHomeScreen(),
        'profile': (context) => const MyProfile(),
        'setting': (context) => const MySetting(),
        'addnotes': (context) => const AddNotes(),
      },
    );
  }
}
