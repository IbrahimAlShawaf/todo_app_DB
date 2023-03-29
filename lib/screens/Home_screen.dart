import 'package:flutter/material.dart';
import 'package:todo_app/screens/sharedprefference.dart';
import 'package:todo_app/widget/app_color.dart';
import 'package:todo_app/widget/search.dart';

import '../widget/alertdialog.dart';
import '../widget/mydrawer.dart';
import 'completetask.dart';
import 'mytask.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // SqlDb sqlDb = SqlDb();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.buttonColor,
        appBar: AppBar(
          backgroundColor: AppColors.buttonColor,
          // centerTitle: true,
          title: const Text(
            'To Do List',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor3,
            ),
          ),
          bottom: TabBar(
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                ),
                text: 'My Task',
                // child: Text('My Task'),
              ),
              Tab(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                text: 'Completed Task',
              ),
            ],
            // mouseCursor: MouseCursor.defer,
            indicatorColor: Colors.red.shade900,
            indicatorWeight: 4,
            indicatorSize: TabBarIndicatorSize.values.first,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await SharedPrefController().clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, 'signinscreen', (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            // IconButton(
            //   onPressed: () async{
            //    await sqlDb.mydeleteDatabase();
            //   },
            //   icon: const Icon(Icons.delete),
            // ),
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchToDo());
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 540,
            decoration: BoxDecoration(
              color: AppColors.textColor3,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: AppColors.cardColor,
              ),
            ),
            child: const TabBarView(
              children: [
                TaskList(),
                //HomePage(),
                CompleteTask(),
              ],
            ),
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 20,
          backgroundColor: AppColors.buttonColor,
          onPressed: () {
            Navigator.of(context).pushNamed('addnotes');
          },
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return MyAlertdialog();
          //   },
          // ),
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
