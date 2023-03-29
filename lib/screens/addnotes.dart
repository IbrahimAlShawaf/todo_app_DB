import 'package:flutter/material.dart';

import '../database/userdatabase.dart';
import 'Home_screen.dart';
import 'mytask.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final DBController _dbController = DBController();
  // Future<List<Map>> readData() async {
  //   List<Map> response = await _dbController.readData('SELECT * FROM notes');
  //   return response;
  // }

  TextEditingController title = TextEditingController();
  TextEditingController disc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            Form(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    int response = await _dbController.insertData('''
                            INSERT INTO notes ( 'title', 'disc')
                            VALUES ( "${title.text}", "${disc.text}")

                        ''');
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (context) => const MyHomeScreen()),
                    //     (Route) => false);
                    if (response > 0) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const MyHomeScreen()),
                          (Route) => false);
                    }
                    // print("response ===============================");
                    // print(response);
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
