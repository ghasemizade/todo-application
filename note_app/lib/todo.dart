import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 1)
class task {
  task({required this.title, required this.subTitle});

  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
}
