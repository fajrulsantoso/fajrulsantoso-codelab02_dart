import 'dart:io';
import 'package:flutter/material.dart';

// Widget untuk menampilkan hasil foto
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - 220411100XXX')),
      body: Image.file(File(imagePath)),
    );
  }
}
