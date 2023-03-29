import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TestSignInScreen extends StatefulWidget {
  @override
  _TestSignInScreenState createState() => _TestSignInScreenState();
}

class _TestSignInScreenState extends State<TestSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  late Database _database;

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  void _openDatabase() async {
    _database = await openDatabase('signin_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            email TEXT,
            password TEXT
          )
          ''');
    });
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final result = await _database.rawQuery(
            'SELECT * FROM users WHERE email = ? AND password = ?',
            [_email, _password]);
        if (result.length > 0) {
          // sign in successful
          print('table user created');
        } else {
          // sign in failed
          print('database opened');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
