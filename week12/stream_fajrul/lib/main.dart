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
  late StreamController<int> numberStreamController;

  @override
  void initState() {
    super.initState();

    NumberStream numberStreamObj = NumberStream();
    numberStreamController = numberStreamObj.controller;

    Stream stream = numberStreamController.stream;

    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });

    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    subscription.onDone(() {
      print("Stream selesai");
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
