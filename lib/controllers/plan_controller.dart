import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/services/plan_services.dart';


class PlanController{
  final services = PlanServices();

  List<Plan> get plans => List.unmodifiable(services.getAllPlans());
  void addNewPlan(String name){
    if (name.isEmpty){
      return;
    }
    name = _checkForDuplicates(plans.map((e) => e.name ), name);
    services.createPlan(name);
  }

  void savePlan(Plan plan){
    services.savePlan(plan);
  }

  void deletePlan(Plan plan){
    services.delete(plan);
  }

  void createNewTask(Plan plan, [String? description]){
    if (description == null || description.isEmpty){
      description = "New task";
    }
    description = _checkForDuplicates(plan.tasks.map((e) => e.description), description);
    services.addTask(plan, description);
  }

  void deleteTask(Plan plan, Task task){
    services.deleteTask(plan, task);
  }

  String _checkForDuplicates(Iterable<String> items, String text){
    final duplicatedCount = items.where((element) => element.contains(text)).length;
    if (duplicatedCount > 0){
      text += " ${duplicatedCount + 1}";
    }
    return text;
  }
}