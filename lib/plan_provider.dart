import 'package:flutter/material.dart';
import 'package:master_plan/controllers/plan_controller.dart';
import 'package:master_plan/models/plan.dart';

class PlanProvider extends InheritedWidget {
  PlanProvider({
    super.key,
    required Widget child,
  }) : super(child: child);
  final _plans = <Plan>[];
  final _controller = PlanController();

  static PlanController of(BuildContext context) {
     final PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    assert(provider != null, 'No PlanProvider found in context');
    return provider!._controller;
  }

  @override
  bool updateShouldNotify(PlanProvider old)=>false;
}
