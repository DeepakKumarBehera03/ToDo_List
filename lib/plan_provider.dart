import 'package:flutter/material.dart';
import 'package:master_plan/models/plan.dart';

class PlanProvider extends InheritedWidget {
  PlanProvider({
    super.key,
    required Widget child,
  }) : super(child: child);
  final _plan = Plan();

  static Plan of(BuildContext context) {
    final PlanProvider? result =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    assert(result != null, 'No PlanProvider found in context');
    return result!._plan;
  }

  @override
  bool updateShouldNotify(PlanProvider old)=>false;
}
