import 'package:flutter/material.dart';
import 'package:todo_app/database/userdatabase.dart';

import '../screens/Home_screen.dart';
import 'app_color.dart';

class MyAlertdialog extends StatefulWidget {
  @override
  State<MyAlertdialog> createState() => _MyAlertdialogState();
}

class _MyAlertdialogState extends State<MyAlertdialog> {
  final DBController _dbController = DBController();

  Future<List<Map>> readData() async {
    List<Map> response = await _dbController.readData('SELECT * FROM notes');
    return response;
  }

  //SqlDb sqlDb = SqlDb();
  //final _todoProvider = TodoProvider();
  TextEditingController title = TextEditingController();
  TextEditingController disc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert Dialog Example'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: title,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _title = value!;
                });
              },
            ),
            TextFormField(
              controller: disc,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _description = value!;
                });
              },
              // onFieldSubmitted: (value) {
              //   _todoProvider.saveTodo(value);
              // },
            ),
            // ElevatedButton(
            //   child: const Text('Pick Date'),
            //   onPressed: () {
            //     showDatePicker(
            //             context: context,
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime.now(),
            //             lastDate: DateTime(DateTime.now().year + 1))
            //         .then((value) {
            //       showTimePicker(
            //               context: context,
            //               initialTime: TimeOfDay(
            //                   hour: TimeOfDay.now().hour,
            //                   minute: TimeOfDay.now().minute))
            //           .then((value) {
            //         // setState(() {
            //         //   timeOfDay = value!;
            //         // });
            //         print(value.toString());
            //       });
            //       // setState(() {
            //       //   dateTime = value!;
            //       // });
            //     });
            //   },
            // ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              // int response = await sqlDb.insertData('''
              //                   INSERT INTO notes ('title', 'disc')
              //                   VALUES ("${title.text}", "${disc.text}")
              //                     ''');

              // if (response > 0) {
              //   Navigator.of(context).pushAndRemoveUntil(
              //       MaterialPageRoute(
              //           builder: (context) => const MyHomeScreen()),
              //       (Route) => false);
              // }
              Navigator.of(context).pop();
            }
          },
        ),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
