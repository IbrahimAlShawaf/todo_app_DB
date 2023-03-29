import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/widget/app_color.dart';

class CompleteTask extends StatefulWidget {
  const CompleteTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CompleteTaskState createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  late bool index;
  final List<String> _tasks = [
    'Todoist',
    'Google Keep',
    'Any.do',
    'Toodle',
    'Todo by Google',
    'Tasks by Google',
    'Todo List by Aakash Patel',
  ];
  final Map<String, bool> _taskCompletion = {
    'Todoist': true,
    'Google Keep': false,
    'Any.do': false,
    'Toodle': false,
    'Todo by Google': false,
    'Tasks by Google': false,
    'Todo List by Aakash Patel': false,
  };
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Slidable(
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const StretchMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: ((context) {}),
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.add,
                label: 'Recovery',
              ),
              SlidableAction(
                onPressed: ((context) {}),
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          child: Card(
            margin: const EdgeInsets.all(8.0),
            color: AppColors.cardColor,
            child: CheckboxListTile(
              value: _taskCompletion[_tasks[index]],
              title: Text(_tasks[index]),
              onChanged: (value) {
                setState(() {
                  _taskCompletion[_tasks[index]] = value!;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
