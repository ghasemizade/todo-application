import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_app/add_task_screen.dart';
import 'package:note_app/todo.dart';
import 'package:note_app/widget_task.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');
  bool isChecked = false;

  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: ((context, index) {
              var task = taskBox.values.toList()[index];
              return taskWidget(task: task);
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNextScreen(context);
        },
        backgroundColor: Color(0xff18DAA3),
        child: Image.asset('assets/images/icon_add.png'),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addTaskScreen()));
  }
}
