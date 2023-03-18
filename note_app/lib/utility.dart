import 'package:note_app/task_type.dart';
import 'package:note_app/todo.dart';
import 'package:note_app/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: './assets/images/hard_working.png',
      title: 'Work Meeting',
      TaskTypeEnum: TaskTypeEnum.working,
    ),
    //
    TaskType(
      image: './assets/images/social_frends.png',
      title: 'Freindly Meeting',
      TaskTypeEnum: TaskTypeEnum.date,
    ),
    //
    TaskType(
      image: './assets/images/meditate.png',
      title: 'Meditation',
      TaskTypeEnum: TaskTypeEnum.focus,
    ),
  ];
  return list;
}
