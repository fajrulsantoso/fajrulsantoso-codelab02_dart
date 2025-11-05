import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // 🔹 Variabel utama plan
  Plan plan = const Plan(name: 'Rencana Harian');

  // 🔹 LANGKAH 10: Tambah ScrollController
  late ScrollController scrollController;

  // 🔹 LANGKAH 11: Tambah Scroll Listener
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // Saat user scroll, hilangkan fokus dari semua TextField
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose(); // wajib untuk mencegah memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan FAJRUL SANTOSO')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // ✅ LANGKAH 8: membuat list scrollable
  Widget _buildList() {
    return ListView.builder(
      controller: scrollController, // gunakan controller di sini
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
    );
  }

  // ✅ LANGKAH 9: membuat tampilan tiap task
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
          });
        },
        decoration: const InputDecoration(
          hintText: 'Tulis deskripsi tugas...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  // 🔹 Tombol tambah task
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }
}
