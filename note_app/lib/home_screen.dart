import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset('assets/images/hard_working.png'),
                  Column(
                    children: [
                      Text('time'),
                      Text('set'),
                      Row(
                        children: [
                          // Time
                          Container(
                            height: 28,
                            width: 83,
                            decoration: BoxDecoration(
                              color: Color(0xff18daa3),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Row(
                                children: [
                                  Text('12:00'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset('assets/images/icon_time.png')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          // Edit
                          Container(
                            height: 32,
                            width: 86,
                            decoration: BoxDecoration(
                              color: Color(0xffE2F6F1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Row(
                                children: [
                                  Text(
                                    'edit',
                                    style: TextStyle(
                                      color: Color(0xff18daa3),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset('assets/images/icon_edit.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  MSHCheckbox(
                    size: 32,
                    value: isChecked,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Color(0xff18daa3),
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isChecked = selected;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
