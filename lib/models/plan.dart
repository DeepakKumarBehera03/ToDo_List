import 'package:master_plan/models/task.dart';

class Plan{
  String name = "";
  final List<Task> tasks = [];

  int get completeCount => tasks
      .where((element) => element.complete)
      .length;

  String get completenessMessage =>
      "$completeCount out of ${tasks.length} tasks";
}