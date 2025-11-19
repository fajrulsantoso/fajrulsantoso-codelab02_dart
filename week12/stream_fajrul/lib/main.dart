import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // ==========================
  // Variabel untuk warna
  // ==========================
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // ==========================
  // Variabel untuk angka
  // ==========================
  int lastNumber = 0;
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();

    // Setup ColorStream
    colorStream = ColorStream();
    colorStream.getColorStream().listen((eventColor) {
      if (!mounted) return;
      setState(() {
        bgColor = eventColor;
      });
    });

    // Setup NumberStream
    numberStream = NumberStream();
    numberStream.controller.stream.listen((event) {
      if (!mounted) return;
      setState(() {
        lastNumber = event;
      });
    });
  }

  // Method untuk menambahkan angka random
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // angka 0–9
    numberStream.addNumberToSink(myNum);
  }

  @override
  void dispose() {
    numberStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Demo')),
      backgroundColor: bgColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
