import 'package:flutter/material.dart';

import '../widget/app_color.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          //final setting = Setting.getSettings()[index];
          return Column(
            children: const [
              Card(
                child: ListTile(
                  // onTap: (){},
                  title: Text('Localization'),
                  subtitle: Text('English/Arabic'),
                  trailing: Icon(Icons.language_outlined),
                ),
              ),
              Card(
                child: ListTile(
                  // onTap: (){},
                  title: Text('Mode'),
                  subtitle: Text('Dark/Light'),
                  trailing: Icon(Icons.mode_night),
                ),
              ),
              Card(
                child: ListTile(
                  // onTap: (){},
                  title: Text('Notification'),
                  subtitle: Text('On/Off'),
                  trailing: Icon(Icons.notifications),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
