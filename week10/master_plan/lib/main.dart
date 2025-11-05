import 'package:flutter/material.dart';
import 'models/plan.dart';
import 'provider/plan_provider.dart'; // ✅ path yang benar
import 'views/plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan(name: 'Rencana Harian')),
        child: const PlanScreen(),
      ),
    );
  }
}
