import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/home_screen.dart';
import 'package:note_app/todo.dart';
import 'package:time_pickerr/time_pickerr.dart';

class editTaskScreen extends StatefulWidget {
  editTaskScreen({super.key, required this.task});
  Task task;
  @override
  State<editTaskScreen> createState() => _editTaskScreenState();
}

class _editTaskScreenState extends State<editTaskScreen> {
  FocusNode wicher0 = FocusNode();
  FocusNode wicher1 = FocusNode();

  TextEditingController? textFiledTaskTitle;
  TextEditingController? textFiledTaskSubTitle;

  DateTime? _time;

  final Box = Hive.box<Task>('taskBox');
  @override
  void initState() {
    super.initState();

    textFiledTaskTitle = TextEditingController(text: widget.task.title);
    textFiledTaskSubTitle = TextEditingController(text: widget.task.subTitle);

    wicher0.addListener(() {
      setState(() {});
    });
    wicher1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ElevatedButton(
                            onPressed: () {
                              String taskTitle = textFiledTaskTitle!.text;
                              String taskSubTitle = textFiledTaskSubTitle!.text;
                              editTask(taskTitle, taskSubTitle);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Edited',
                              style:
                                  TextStyle(fontFamily: 'lato', fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff18daa3),
                              minimumSize: Size(200, 44),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
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
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: textFiledTaskSubTitle,
                      style: TextStyle(fontFamily: 'gm', fontSize: 18),
                      maxLines: 2,
                      focusNode: wicher1,
                      decoration: InputDecoration(
                        labelText: 'description',
                        labelStyle: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 28,
                          color: wicher1.hasFocus
                              ? Color(0xff18daa3)
                              : Color(0xffC5C5C5),
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
                  CustomHourPicker(
                    title: 'Set Time',
                    positiveButtonText: 'Ok',
                    negativeButtonText: 'Cancel',
                    titleStyle: TextStyle(
                      color: Color(0xff18DAA3),
                      fontFamily: 'lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    negativeButtonStyle: TextStyle(
                      color: Colors.red,
                    ),
                    positiveButtonStyle: TextStyle(
                      color: Color(0xff18DAA3),
                    ),
                    elevation: 5,
                    onPositivePressed: (context, time) {
                      _time = time;
                    },
                    onNegativePressed: (context) {},
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.title = taskTitle;
    widget.task.subTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.save();
  }

  void _navigateToBackHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => homeScreen()));
  }
}
