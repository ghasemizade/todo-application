import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/add_task_screen.dart';
import 'package:note_app/home_screen.dart';
import 'package:note_app/todo.dart';

void main() async {
  Hive.registerAdapter(taskAdapter());
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  await Hive.openBox<task>('taskBox');
  runApp(noteApp());
}

class noteApp extends StatelessWidget {
  const noteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'FineCollege',
      ),
      home: homeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
