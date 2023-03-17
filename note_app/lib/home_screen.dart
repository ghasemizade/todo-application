import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_app/add_task_screen.dart';
import 'package:note_app/edit_task.dart';
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
  bool isFabShow = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Center(
            child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    isFabShow = true;
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    isFabShow = false;
                  }
                });
                return true;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: taskBox.values.length,
                  itemBuilder: ((context, index) {
                    var task = taskBox.values.toList()[index];
                    return getListItems(task);
                  }),
                ),
              ),
            );
          },
        )),
        floatingActionButton: Visibility(
          visible: isFabShow,
          child: FloatingActionButton(
            onPressed: () {
              _navigateToAddTask(context);
            },
            backgroundColor: Color(0xff18DAA3),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget getListItems(Task task) {
    return DismissibleTile(
      key: UniqueKey(),
      // delete
      ltrOverlayDismissed: const Text('Deleted'),
      ltrOverlay: const Text('Delete'),
      rtlOverlay: const Text('Delete'),
      rtlOverlayDismissed: const Text('Deleted'),
      onDismissed: (direction) {
        task.delete();
      },
      child: taskWidget(task: task),
    );
  }

  void _navigateToAddTask(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addTaskScreen()));
  }
}
