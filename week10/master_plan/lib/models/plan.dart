import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  Plan copyWith({String? name, List<Task>? tasks}) {
    return Plan(name: name ?? this.name, tasks: tasks ?? this.tasks);
  }

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount dari ${tasks.length} tugas selesai';

  // Untuk tampilan di list
  String get shortCompletenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
