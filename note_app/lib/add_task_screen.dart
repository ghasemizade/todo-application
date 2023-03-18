import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:note_app/home_screen.dart';
import 'package:note_app/task_type.dart';
import 'package:note_app/todo.dart';
import 'package:note_app/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

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

  DateTime? _time;
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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
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
                  SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff18DAA3),
                        minimumSize: Size(200, 44),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return getCustomHourPicker();
                          },
                        );
                      },
                      child: buildButtonName(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: getTaskTypeList().length,
                      itemBuilder: (context, index) {
                        return TaskTypeItems(
                          taskType: getTaskTypeList()[index],
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      onPressed: () {
                        String taskTitle = textFiledTaskTitle.text;
                        String taskSubTitle = textFiledTaskSubTitle.text;
                        if (taskTitle == '') {
                          Fluttertoast.showToast(
                              msg: 'title is empty',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          addTask(taskTitle, taskSubTitle);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Add Task',
                        style: TextStyle(fontFamily: 'lato', fontSize: 20),
                      ),
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
            )
          ],
        ),
      ),
    );
  }

  CustomHourPicker getCustomHourPicker() {
    return CustomHourPicker(
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
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var AddTask = Task(title: taskTitle, subTitle: taskSubTitle, time: _time!);
    Box.add(AddTask);
  }

  void _navigateToBackHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => homeScreen()));
  }

  SizedBox buildButtonName() {
    return SizedBox(
      child: Center(
        child: Text(
          "Set Time",
          style: TextStyle(fontSize: 20, fontFamily: 'lato'),
        ),
      ),
      height: 44,
      width: 200,
    );
  }
}

class TaskTypeItems extends StatelessWidget {
  TaskTypeItems({super.key, required this.taskType});

  TaskType taskType;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 140,
            color: Color.fromARGB(108, 212, 212, 212),
            child: Column(
              children: [
                Image.asset(taskType.image),
                Text(taskType.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
