import 'package:flutter/material.dart';

class TujuanPage extends StatelessWidget {
  const TujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ini Halaman Tujuan",
          style: TextStyle(color: Colors.white),
        ), // Text
        backgroundColor: Colors.deepOrange,
      ), // AppBar
      backgroundColor: Colors.deepOrange,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Untuk berpindah ke halaman baru, gunakan metode Navigator.push(). Metode push() akan menambahkan Route ke dalam tumpukan Route yang dikelola oleh Navigator. Route ini dapat dibuat secara kustom atau menggunakan MaterialPageRoute, yang memiliki animasi tramslasi sesuai dengan platform yang  digunakan.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ), // TextStyle
                textAlign: TextAlign.justify,
              ), // Text
              const SizedBox(height: 20),
              Image.asset(
                'assets/image/island.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ), // Image.asset
              const SizedBox(height: 20),
              const Text(
                "Untuk menutup halaman ke dua kembali ke halaman pertama, gunakan metode Navigator.pop() akan menghapus Route saat ini dari tumpukan Route yang dikelola oleh Navigator",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ), // TextStyle
                textAlign: TextAlign.justify,
              ), // Text
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // RoundedRectangleBorder
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "< Kembali ke home",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ), // TextStyle
                ), // Text
              ), // ElevatedButton
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}