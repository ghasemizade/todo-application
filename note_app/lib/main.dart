import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/add_task_screen.dart';
import 'package:note_app/home_screen.dart';
import 'package:note_app/todo.dart';
import 'package:note_app/widget_task.dart';

void main() async {
  Hive.registerAdapter(TaskAdapter());
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  await Hive.openBox<Task>('taskBox');
  runApp(noteApp());
}

class noteApp extends StatelessWidget {
  const noteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'lato',
      ),
      home: homeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
