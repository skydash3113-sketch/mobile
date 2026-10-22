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
      title: 'Demo ListView',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget listTile(
      Color warna,
      Color warnaAvatar,
      String judul,
      String subjudul,
      String gambar,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: warnaAvatar,
          child: Image.asset(
            gambar,
            width: 30,
            height: 30,
          ),
        ),
        title: Text(
          judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subjudul),
        trailing: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          listTile(
            Colors.blue.shade100,
            Colors.blue,
            'Kehadiran',
            'Presensi kehadiran kuliah',
            'assest/boy.png',
          ),
          listTile(
            Colors.green.shade100,
            Colors.green,
            'Jadwal',
            'Jadwal perkuliahan',
            'assest/timetable.png',
          ),
          listTile(
            Colors.orange.shade100,
            Colors.orange,
            'Tugas',
            'Tugas perkuliahan di luar kelas',
            'assest/homeschooling.png',
          ),
          listTile(
            Colors.red.shade100,
            Colors.red,
            'Pengumuman',
            'Informasi terkait perkuliahan',
            'assest/clipboard-list-check.png',
          ),
          listTile(
            Colors.purple.shade100,
            Colors.purple,
            'Nilai',
            'Nilai ujian dan tugas',
            'assest/mark.png',
          ),
          listTile(
            Colors.teal.shade100,
            Colors.teal,
            'Catatan',
            'Pengingat kegiatan perkuliahan',
            'assest/pencil.png',
          ),
        ],
      ),
    );
  }
}