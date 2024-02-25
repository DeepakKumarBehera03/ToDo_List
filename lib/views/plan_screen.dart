import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/plan_provider.dart';
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key, required this.plan});
  final Plan plan;

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan =  Plan();
  ScrollController? scrollController;
  Plan get plans => widget.plan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    scrollController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(
      canPop : true,
      onPopInvoked: (didpop) async{
        final controller = PlanProvider.of(context);
        controller.savePlan(plan);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Master Plan"),
        ),
        body: Column(
          children: [
            Expanded(
                child: _buildList(),
            ),
            SafeArea(child: Text(plan.completenessMessage,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            ),
          ],
        ),
        floatingActionButton: _buildAddTaskButton(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index)=>
        _buildTaskTile(plan.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task){
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red,),
      direction: DismissDirection.endToStart,
      onDismissed: (_){
        final controller = PlanProvider.of(context);
        controller.deletePlan(plan);
        setState(() {
        });
      },
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected){
            setState(() {
              task.complete = selected!;
            });
          },
        ),
        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: (text){
            setState(() {
              task.description = text;
            });
          },
        )
      ),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){
        final controller = PlanProvider.of(context);
        controller.createNewTask(plan);
        setState(() {
          // plan.tasks.add(Task());
        });
      },
    );
  }


}
