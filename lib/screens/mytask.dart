import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/screens/editnotes.dart';
import 'package:todo_app/screens/sharedprefference.dart';
import 'package:todo_app/widget/app_color.dart';

import '../database/userdatabase.dart';
import '../widget/mydrawer.dart';
import '../widget/search.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final DBController _dbController = DBController();

  bool isLoading = true;
  List notes = [];

  Future readData() async {
    List<Map> response = await _dbController.readData('SELECT * FROM notes');
    notes.addAll(response);
    Future.delayed(const Duration(seconds: 20));
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 3, right: 5, left: 5, bottom: 0),
                        child: Card(
                          color: AppColors.cardColor,
                          child: ListTile(
                            //style: ListTileStyle.list,
                            title: Text(
                              '${notes[index]['title']}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor1,
                              ),
                            ),
                            subtitle: Text(
                              '${notes[index]['disc']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor2,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    int response = await _dbController.deleteData(
                                        "DELETE FROM notes WHERE id = ${notes[index]['id']}");
                                    if (response > 0) {
                                      notes.removeWhere((element) =>
                                          element['id'] == notes[index]['id']);
                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => EditNotes(
                                                  title: notes[index]['title'],
                                                  disc: notes[index]['disc'],
                                                  id: notes[index]['id'],
                                                )));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
          
        
      

      // ListView.builder(
      //   itemCount: _tasks.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Slidable(
      //       startActionPane: ActionPane(
      //         // A motion is a widget used to control how the pane animates.
      //         motion: const StretchMotion(),

      //         // A pane can dismiss the Slidable.
      //         dismissible: DismissiblePane(onDismissed: () {}),

      //         // All actions are defined in the children parameter.
      //         children: [
      //           // A SlidableAction can have an icon and/or a label.
      //           SlidableAction(
      //             onPressed: ((context) {
      //               _deleteTask;
      //             }),
      //             backgroundColor: const Color(0xFFFE4A49),
      //             foregroundColor: Colors.white,
      //             icon: Icons.delete,
      //             label: 'Delete',
      //           ),
      //           // SlidableAction(
      //           //   onPressed: ((context) {}),
      //           //   backgroundColor: const Color(0xFF21B7CA),
      //           //   foregroundColor: Colors.white,
      //           //   icon: Icons.share,
      //           //   label: 'Share',
      //           // ),
      //           SlidableAction(
      //             onPressed: ((context) {}),
      //             backgroundColor: const Color(0xFF2227CA),
      //             foregroundColor: Colors.white,
      //             icon: Icons.update_outlined,
      //             label: 'Update',
      //           ),
      //         ],
      //       ),
      //       child: Card(
      //         margin: const EdgeInsets.all(8.0),
      //         color: AppColors.cardColor,
      //         child: CheckboxListTile(
      //           value: _taskCompletion[_tasks[index]],
      //           title: Text(_tasks[index]),
      //           onChanged: (value) {
      //             setState(() {
      //               _taskCompletion[_tasks[index]] = value!;
      //             });
      //           },
      //         ),
      //       ),
      //     );
      //   },
      // ),
    
  

