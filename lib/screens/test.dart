import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../widget/alertdialog.dart';
import '../widget/app_color.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Database _database;
  List<Map<String, dynamic>> _todos = [];

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  void _openDatabase() async {
    _database = await openDatabase('todos_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY,
            title TEXT,
            completed INTEGER
          )
          ''');
    });
    _readTodos();
  }

  void _readTodos() async {
    final todos = await _database.query('todos');
    setState(() {
      _todos = todos;
    });
  }

  void _createTodo(String title) async {
    final id =
        await _database.insert('todos', {'title': title, 'completed': 0});
    _readTodos();
  }

  void _updateTodo(Map<String, dynamic> todo) async {
    final id = todo['id'];
    await _database.update('todos', todo, where: 'id = ?', whereArgs: [id]);
    _readTodos();
  }

  void _deleteTodo(int id) async {
    await _database.delete('todos', where: 'id = ?', whereArgs: [id]);
    _readTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo['title']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // show edit dialog
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTodo(todo['id']);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 20,
          backgroundColor: AppColors.buttonColor,
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return MyAlertdialog();
            },
          ),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
    );
  }
}
