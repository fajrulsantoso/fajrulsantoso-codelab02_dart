import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAJRUL SANTOSO 11',
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
  // Langkah 8: Tambah variabel
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Langkah 9: Tambah method changeColor()
  void changeColor() async {
    await for (var eventColor in colorStream.getColorStream()) {
      if (!mounted) return; // pastikan widget masih aktif
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  // Langkah 10: Override initState()
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream')),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1), // animasi perubahan warna
        color: bgColor,
        child: const Center(
          child: Text(
            'Selamat Datang!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
