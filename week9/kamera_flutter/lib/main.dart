import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'widget/takepicture_screen.dart';

CameraDescription? firstCamera;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  } on CameraException catch (e) {
    print('Error accessing camera: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (firstCamera == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Kamera tidak ditemukan atau error inisialisasi.'),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TakePictureScreen(camera: firstCamera!),
    );
  }
}
