import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_screen.dart';

import '../models/plan.dart';
class PlanCreaterScreen extends StatefulWidget {
  const PlanCreaterScreen({super.key});

  @override
  State<PlanCreaterScreen> createState() => _PlanCreaterScreenState();
}

class _PlanCreaterScreenState extends State<PlanCreaterScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Plan's"),
      ),
      body: Column(
        children: [
            _buildListCreater(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  Widget _buildListCreater(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: "Add a Plan",
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  void addPlan(){
    final text = textController.text;

    if(text.isEmpty){
      return;
    }
    final plan = Plan()..name = text;
    PlanProvider.of(context).add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {

    });
  }

  Widget _buildMasterPlans(){
    final plans = PlanProvider.of(context);

    if (plans.isEmpty){
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.note, size: 100, color: Colors.grey,),
          Text("You do not have any plan's yet",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );
    }

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index){
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlanScreen(plan : plan)
              )
            );
          },
        );
      },
    );
  }
}
