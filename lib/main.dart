import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_creater_screen.dart';

void main(){
  runApp(PlanProvider(child: const MasterPlanApp()));
}
class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PlanCreaterScreen()
    );
  }
}
