import 'package:master_plan/models/task.dart';

import '../repositories/repository.dart';

class Plan{
  String name = "";
  final int? id;
  final List<Task> tasks = [];

  Plan({this.id, this.name = ""});

  int get completeCount => tasks
      .where((element) => element.complete)
      .length;

  String get completenessMessage =>
      "$completeCount out of ${tasks.length} tasks";

  Plan.fromModel(Model model)
  :id = model.id,
  name = model.data['task']
  ?.map<Task>((task) => Task.fromModel(task))
  ?.toString() ?? <Task>[].toString();

  Model toModel() => Model(id: id!,data: {
    'name':name,
    'tasks':tasks.map((e) => e.toModel()).toList()
  });
}