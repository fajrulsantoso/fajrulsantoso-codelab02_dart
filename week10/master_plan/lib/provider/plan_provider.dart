import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required Widget child,
    required ValueNotifier<List<Plan>> notifier,
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    if (provider == null) {
      throw FlutterError('PlanProvider tidak ditemukan dalam context');
    }
    if (provider.notifier == null) {
      throw FlutterError('PlanProvider notifier is null');
    }
    return provider.notifier!;
  }
}