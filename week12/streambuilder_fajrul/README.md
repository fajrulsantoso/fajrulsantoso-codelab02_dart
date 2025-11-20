# streambuilder_fajrul

## 8. Praktikum 6: StreamBuilder
StreamBuilder adalah sebuah widget untuk melakukan listen terhadap event dari stream. Ketika sebuah event terkirim, maka akan dibangun ulang semua turunannya. Seperti halnya widget FutureBuilder pada pertemuan pekan lalu, StreamBuilder berguna untuk membangun UI secara reaktif yang diperbarui setiap data baru tersedia. 

## JAWABAN
![Praktikum ](img/P12P6L6.JPG) 

## Langkah 2: Buat file baru stream.dart
### 💻 Source Code  
```dart
 class NumberStream {}

```

---


## Langkah 3: Tetap di file stream.dart
Ketik kode seperti berikut.
### 💻 Source Code  
```dart
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}
```

--- 

## Langkah 4: Edit main.dart
Ketik kode seperti berikut ini. 
### 💻 Source Code  
```dart
import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Container(
      ),
    );
  }
}
```

--- 


## Langkah 5: Tambah variabel
Di dalam class _StreamHomePageState, ketika variabel ini.
### 💻 Source Code  
```dart
late Stream<int> numberStream;
```

---

## Langkah 6: Edit initState()
### 💻 Source Code  
```dart
@override
void initState() {
  numberStream = NumberStream().getNumbers();
  super.initState();
}
```

--- 

## Langkah 7: Edit method build()
### 💻 Source Code  
```dart
body: StreamBuilder(
  stream: numberStream,
  initialData: 0,
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      print('Error!');
    }

    if (snapshot.hasData) {
      return Center(
        child: Text(
          snapshot.data.toString(),
          style: const TextStyle(fontSize: 96),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  },
),
```

---


Soal 12
## Jelaskan maksud kode pada langkah 3 dan 7 !
✅ Penjelasan Langkah 3

Pada langkah 3, dibuat sebuah stream yang menghasilkan angka acak setiap 1 detik. Stream ini bekerja terus-menerus dan mengirim data baru secara berkala agar bisa ditampilkan di aplikasi. Intinya, langkah 3 bertugas membuat sumber data yang berubah secara real-time.

✅ Penjelasan Langkah 7

Pada langkah 7, digunakan StreamBuilder untuk mendengarkan stream yang sudah dibuat pada langkah 3. Setiap kali data baru datang, tampilan aplikasi langsung diperbarui otomatis, dan angka terbaru ditampilkan di tengah layar. Intinya, langkah 7 bertugas menghubungkan data stream ke UI.

## Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

## JAWABAN
![Praktikum ](img/P12P6L12.JPG) 
## Lalu lakukan commit dengan pesan "W12: Jawaban Soal 12".
