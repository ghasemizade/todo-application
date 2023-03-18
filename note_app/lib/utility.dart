import 'package:note_app/task_type.dart';
import 'package:note_app/todo.dart';
import 'package:note_app/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    // hard work
    TaskType(
      image: './assets/images/hard_working.png',
      title: 'Hard Meeting',
      TaskTypeEnum: TaskTypeEnum.working,
    ),
    // social freind
    TaskType(
      image: './assets/images/social_frends.png',
      title: 'Freindly Meeting',
      TaskTypeEnum: TaskTypeEnum.date,
    ),
    // meditate
    TaskType(
      image: './assets/images/meditate.png',
      title: 'Meditation',
      TaskTypeEnum: TaskTypeEnum.focus,
    ),
    // workout
    TaskType(
      image: './assets/images/workout.png',
      title: 'Workout',
      TaskTypeEnum: TaskTypeEnum.workout,
    ),
    // meeting
    TaskType(
      image: './assets/images/work_meeting.png',
      title: 'Work Meeting',
      TaskTypeEnum: TaskTypeEnum.workout,
    ),
  ];
  return list;
}
