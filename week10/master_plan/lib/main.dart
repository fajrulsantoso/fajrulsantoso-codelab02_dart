import 'package:flutter/material.dart';
import 'models/data_layer.dart';
import 'provider/plan_provider.dart';
import 'views/plan_creator_screen.dart';

void main() {
  runApp(const PlanApp());
}

class PlanApp extends StatelessWidget {
  const PlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>([
        Plan(
          name: 'Try to take over the world',
          tasks: [
            Task(description: 'Task 1', complete: true),
            Task(description: 'Task 2', complete: false),
            Task(description: 'Task 3', complete: false),
          ],
        ),
        Plan(
          name: 'Invent New Form of Cheese',
          tasks: List.generate(
            14,
            (index) =>
                Task(description: 'Cheese task ${index + 1}', complete: false),
          ),
        ),
        Plan(
          name: 'Learn Flutter',
          tasks: [
            ...List.generate(
              6,
              (index) => Task(
                description: 'Flutter task ${index + 1}',
                complete: true,
              ),
            ),
            ...List.generate(
              8,
              (index) => Task(
                description: 'Flutter task ${index + 7}',
                complete: false,
              ),
            ),
          ],
        ),
      ]),
      child: MaterialApp(
        title: 'Master Plans',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
