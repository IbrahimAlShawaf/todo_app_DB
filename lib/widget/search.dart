import 'package:flutter/material.dart';

class SearchToDo extends SearchDelegate {
  List<String> tasks = [
    'Todoist',
    'Google Keep',
    'Any.do',
    'Toodle',
    'Todo by Google',
    'Tasks by Google',
    'Todo List by Aakash Patel',
    'To-Do List & Task Manager by Readdle',
    'Todo by MobiTech',
    'Todo List - Simple To-Do by Flutter Team.',
  ];
  List<String> recentTasks = [
    'Todoist',
    'Google Keep',
    'Any.do',
    'Toodle',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && tasks.contains(query)) {
      return ListTile(
        title: Text(query),
      );
    } else if (query == '') {
      return const Text('');
    } else {
      return const ListTile(
        title: Text('No Results Found'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: recentTasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(recentTasks[index]),
        );
      },
    );
  }
}
