import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo GridView',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget tile(
      Color warnaKotak,
      String gambar,
      String judul,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnaKotak,
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              judul,
              textAlign: TextAlign.center,
            ),
          ),
          child: Image.asset(
            gambar,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          tile(
            Colors.blue,
            'assest/boy.png',
            'Kehadiran',
          ),
          tile(
            Colors.green,
            'assest/timetable.png',
            'Jadwal Kuliah',
          ),
          tile(
            Colors.orange,
            'assest/homeschooling.png',
            'Tugas',
          ),
          tile(
            Colors.red,
            'assest/clipboard-list-check.png',
            'Pengumuman',
          ),
          tile(
            Colors.purple,
            'assest/mark.png',
            'Nilai',
          ),
          tile(
            Colors.teal,
            'assest/pencil.png',
            'Catatan',
          ),
        ],
      ),
    );
  }
}