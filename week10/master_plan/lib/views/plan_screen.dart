import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;

  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> planListNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: planListNotifier,
      builder: (context, planList, child) {
        Plan currentPlan = planList.firstWhere(
          (p) => p.name == plan.name,
          orElse: () => plan,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(currentPlan.name),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Expanded(child: _buildList(currentPlan, planListNotifier)),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${currentPlan.completedCount} out of ${currentPlan.tasks.length} tasks',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: _buildAddTaskButton(
            planListNotifier,
            currentPlan,
          ),
        );
      },
    );
  }

  Widget _buildList(
    Plan currentPlan,
    ValueNotifier<List<Plan>> planListNotifier,
  ) {
    return ListView.builder(
      controller: scrollController,
      itemCount: currentPlan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(currentPlan, index, planListNotifier),
    );
  }

  Widget _buildTaskTile(
    Plan currentPlan,
    int index,
    ValueNotifier<List<Plan>> planListNotifier,
  ) {
    final task = currentPlan.tasks[index];

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          _updateTask(
            planListNotifier,
            currentPlan,
            index,
            task.copyWith(complete: selected ?? false),
          );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          _updateTask(
            planListNotifier,
            currentPlan,
            index,
            task.copyWith(description: text),
          );
        },
        decoration: const InputDecoration(
          hintText: 'Tulis deskripsi tugas...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _updateTask(
    ValueNotifier<List<Plan>> planListNotifier,
    Plan currentPlan,
    int taskIndex,
    Task updatedTask,
  ) {
    final planIndex = planListNotifier.value.indexWhere(
      (p) => p.name == currentPlan.name,
    );

    if (planIndex != -1) {
      final updatedTasks = List<Task>.from(currentPlan.tasks);
      updatedTasks[taskIndex] = updatedTask;

      final updatedPlan = currentPlan.copyWith(tasks: updatedTasks);
      final updatedList = List<Plan>.from(planListNotifier.value);
      updatedList[planIndex] = updatedPlan;

      planListNotifier.value = updatedList;
    }
  }

  Widget _buildAddTaskButton(
    ValueNotifier<List<Plan>> planListNotifier,
    Plan currentPlan,
  ) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final planIndex = planListNotifier.value.indexWhere(
          (p) => p.name == currentPlan.name,
        );

        if (planIndex != -1) {
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..add(const Task());

          final updatedPlan = currentPlan.copyWith(tasks: updatedTasks);
          final updatedList = List<Plan>.from(planListNotifier.value);
          updatedList[planIndex] = updatedPlan;

          planListNotifier.value = updatedList;
        }
      },
    );
  }
}
