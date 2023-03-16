import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_app/todo.dart';

class taskWidget extends StatefulWidget {
  taskWidget({super.key, required this.task});
  Task task;
  @override
  State<taskWidget> createState() => _taskWidgetState();
}

class _taskWidgetState extends State<taskWidget> {
  bool isCheckBox = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCheckBox = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCheckBox = !isCheckBox;
          widget.task.isDone = isCheckBox;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset('assets/images/hard_working.png'),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'lato',
                      fontSize: 18,
                    ),
                  ),
                  // Checkbox(
                  //   value: isCheckBox,
                  //   onChanged: (isChecked) {},
                  // )
                  MSHCheckbox(
                    size: 32,
                    value: isCheckBox,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Color(0xff18daa3),
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      setState(() {
                        isCheckBox = selected;
                      });
                    },
                  ),
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              getTime_Edit(),
            ],
          ),
        ),
      ],
    );
  }

  Row getTime_Edit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Time
        Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            color: Color(0xff18daa3),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                Text(
                  '12:00',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
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
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            color: Color(0xffE2F6F1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                Text(
                  'edit',
                  style: TextStyle(
                    color: Color(0xff18daa3),
                  ),
                ),
                Spacer(),
                Image.asset('assets/images/icon_edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
