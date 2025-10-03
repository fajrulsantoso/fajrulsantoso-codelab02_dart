import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Malang ')),

        // Menambahkan gambar dari aset
        body: ListView(
          children: [
            Image.asset(
              'img/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),

            //  Menambahkan title row  (judul  + lokasi + bintang)
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: const Text(
                            'Wisata Gunung di Batu',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          'Batu, Malang, Indonesia',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.red),
                  const Text('41'),
                ],
              ),
            ),
            // Menambahkan button row (CALL, ROUTE, SHARE)
            // Setelah title Container, tambahkan:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.call, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('CALL', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.near_me, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('ROUTE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.share, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('SHARE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),

            // Menambahkan deskripsi (text section)
            // Setelah Row tombol, tambahkan:
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Danau Oeschinen terletak di kaki gunung Blüemlisalp di Pegunungan Alpen Bernese. '
                'Dengan ketinggian 1.578 meter di atas permukaan laut, danau ini merupakan salah satu danau Alpen yang lebih besar. '
                'Perjalanan gondola dari Kandersteg, dilanjutkan dengan berjalan kaki selama setengah jam melewati padang rumput '
                'dan hutan pinus, akan membawa Anda ke danau yang suhunya dapat mencapai 20 derajat Celsius di musim panas. '
                'Kegiatan yang dapat dinikmati di sini antara lain mendayung dan menaiki lintasan toboggan musim panas.\n\n'
                'Nama: Fajrul Santoso\n'
                'NIM: 244107023010',
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),

            const SizedBox(height: 16),
            const Center(child: Text('')),
          ],
        ),
      ),
    );
  }
}
