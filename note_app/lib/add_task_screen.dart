import 'package:flutter/material.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  FocusNode wicher0 = FocusNode();
  FocusNode wicher1 = FocusNode();

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
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(fontFamily: 'gm', fontSize: 18),
                focusNode: wicher0,
                decoration: InputDecoration(
                  labelText: 'task',
                  labelStyle: TextStyle(
                    fontFamily: 'FineCollege',
                    fontSize: 20,
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
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: TextStyle(fontFamily: 'gm', fontSize: 18),
                maxLines: 3,
                focusNode: wicher1,
                decoration: InputDecoration(
                  labelText: 'description',
                  labelStyle: TextStyle(
                    fontFamily: 'FineCollege',
                    fontSize: 20,
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
}
