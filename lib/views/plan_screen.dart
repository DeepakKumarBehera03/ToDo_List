import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/models/plan.dart';
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  ScrollController? scrollController;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Plan"),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
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

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (){
        setState(() {
          plan.tasks.add(Task());
        });
      },
    );
  }

  Widget _buildTaskTile(Task task){
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected){
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextField(
        onChanged: (text){
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }


}
