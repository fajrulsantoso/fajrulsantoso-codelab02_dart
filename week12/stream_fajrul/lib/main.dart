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
  // Warna
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Angka
  int lastNumber = 0;
  late NumberStream numberStream;

  // ====== LANGKAH 1: Tambahkan variabel transformer ======
  late StreamTransformer<int, int> transformer;

  @override
  void initState() {
    super.initState();

    // Warna berubah otomatis
    colorStream = ColorStream();
    colorStream.getColorStream().listen((eventColor) {
      if (!mounted) return;
      setState(() {
        bgColor = eventColor;
      });
    });

    // Setup NumberStream
    numberStream = NumberStream();

    // ====== LANGKAH 2: Buat transformer ======
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); // ubah data
      },
      handleError: (error, trace, sink) {
        sink.add(-1); // kirim nilai error
      },
      handleDone: (sink) => sink.close(),
    );

    // ====== LANGKAH 3: Terapkan transformer pada stream ======
    numberStream.controller.stream
        .transform(transformer)
        .listen((event) {
          if (!mounted) return;
          setState(() {
            lastNumber = event;
          });
        })
        .onError((error) {
          if (!mounted) return;
          setState(() {
            lastNumber = -1;
          });
        });
  }

  // Tombol angka random
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
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
