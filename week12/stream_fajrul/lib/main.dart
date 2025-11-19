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
      title: 'Stream',
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
  int lastNumber = 0;

  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  late StreamController<int> numberStreamController;

  String values = '';

  @override
  void initState() {
    super.initState();

    NumberStream numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // ==== LANGKAH 4: broadcast stream ====
    Stream stream = numberStreamController.stream.asBroadcastStream();

    // Listener 1
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
        values += '$event - ';
      });
    });

    // Listener 2
    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int value = random.nextInt(10);

    if (!numberStreamController.isClosed) {
      numberStreamController.sink.add(value);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    numberStreamController.close();
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream")),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 40, color: Colors.black87),
            ),

            // ==== LANGKAH 5 ====
            Text(
              values,
              style: const TextStyle(fontSize: 20, color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text("New Random Number"),
            ),
            ElevatedButton(
              onPressed: stopStream,
              child: const Text("Stop Subscription"),
            ),
          ],
        ),
      ),
    );
  }
}
