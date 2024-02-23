import 'package:master_plan/models/data_layer.dart';


class PlanController{
  final _plans = <Plan>[];

  List<Plan> get plans => List.unmodifiable(_plans);
  void addNewPlan(String name){
    if (name.isEmpty){
      return;
    }
    name = _checkForDuplicates(_plans.map((e) => e.name ), name);
    final plan = Plan()..name = name;
    _plans.add(plan);
  }

  void deletePlan(Plan plan){
    _plans.remove(plan);
  }

  void createNewTask(Plan plan, [String? description]){
    if (description == null || description.isEmpty){
      description = "New task";
    }
    description = _checkForDuplicates(plan.tasks.map((e) => e.description), description);
    final task = Task()..description = description;
    plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task){
    plan.tasks.remove(task);
  }

  String _checkForDuplicates(Iterable<String> items, String text){
    final duplicatedCount = items.where((element) => element.contains(text)).length;
    if (duplicatedCount > 0){
      text += " ${duplicatedCount + 1}";
    }
    return text;
  }
}