import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import 'plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Plans'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: _buildMasterPlans(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddPlanDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddPlanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Buat Plan Baru'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Nama Plan',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _controller.clear();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isEmpty) return;

                final planName = _controller.text.trim();
                final planNotifier = PlanProvider.of(context);
                final existingPlans = planNotifier.value;

                if (existingPlans.any((p) => p.name == planName)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Plan "$planName" sudah ada')),
                  );
                  return;
                }

                Plan newPlan = Plan(name: planName);
                planNotifier.value = [...existingPlans, newPlan];

                Navigator.of(context).pop();
                _controller.clear();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Plan "$planName" berhasil dibuat')),
                );
              },
              child: const Text('Buat'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMasterPlans() {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ValueListenableBuilder<List<Plan>>(
      valueListenable: planNotifier,
      builder: (context, plans, child) {
        if (plans.isEmpty) {
          return const Center(child: Text('Belum ada rencana'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2.0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                title: Text(
                  plan.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    '${plan.completedCount} out of ${plan.tasks.length} tasks',
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
