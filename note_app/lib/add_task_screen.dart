import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/home_screen.dart';
import 'package:note_app/todo.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  FocusNode wicher0 = FocusNode();
  FocusNode wicher1 = FocusNode();

  final TextEditingController textFiledTaskTitle = TextEditingController();
  final TextEditingController textFiledTaskSubTitle = TextEditingController();

  final Box = Hive.box<Task>('taskBox');
  @override
  void initState() {
    super.initState();
    wicher0.addListener(() {
      setState(() {});
    });
    wicher1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToBackHome(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: Color(0xff18DAA3),
                        elevation: 5,
                        shadowColor: Colors.black),
                    child: Container(
                      height: 60,
                      width: 30,
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: textFiledTaskTitle,
                style: TextStyle(
                    fontFamily: 'gm',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                focusNode: wicher0,
                decoration: InputDecoration(
                  labelText: 'task',
                  labelStyle: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 28,
                    color: wicher0.hasFocus
                        ? Color(0xff18daa3)
                        : Color(0xffc5c5c5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffc5c5c5),
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xffc5c5c5),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: textFiledTaskSubTitle,
                style: TextStyle(fontFamily: 'gm', fontSize: 18),
                maxLines: 3,
                focusNode: wicher1,
                decoration: InputDecoration(
                  labelText: 'description',
                  labelStyle: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 28,
                    color: wicher0.hasFocus
                        ? Color(0xffc5c5c5)
                        : Color(0xff18daa3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xffc5c5c5),
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3.0,
                      color: Color(0xffc5c5c5),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                onPressed: () {
                  String taskTitle = textFiledTaskTitle.text;
                  String taskSubTitle = textFiledTaskSubTitle.text;
                  addTask(taskTitle, taskSubTitle);
                },
                child: Text('Add task'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff18daa3),
                  minimumSize: Size(200, 44),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    wicher0.dispose();
    wicher1.dispose();
    super.dispose();
  }

  addTask(String taskTitle, String taskSubTitle) {
    var AddTask = Task(title: taskTitle, subTitle: taskSubTitle);
    Box.add(AddTask);
  }

  void _navigateToBackHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => homeScreen()));
  }
}
