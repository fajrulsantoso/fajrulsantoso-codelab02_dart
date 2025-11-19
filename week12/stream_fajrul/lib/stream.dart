import 'package:flutter/material.dart';
import 'dart:async';

// Stream warna
class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
  ];

  Stream<Color> getColorStream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      return colors[t % colors.length];
    });
  }
}

// Stream angka
class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  void close() {
    controller.close();
  }
}
