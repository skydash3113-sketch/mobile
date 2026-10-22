import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alignment',
      theme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Malang',
                style: TextStyle(fontSize: 40),
              ), // Text
              Text(
                '25°',
                style: TextStyle(fontSize: 120),
              ), // Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  harian('Senin', Icons.cloud, '20°'),
                  harian('Selasa', Icons.snowing, '30°'),
                  harian('Rabu', Icons.sunny, '15°'),
                ],
              )  // Row
            ],
          ), // Column
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}

Container harian (String hari, IconData icon, String suhu) {
  return Container(
    height: 105,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hari,
          style: TextStyle(fontSize: 25),
        ), // Text
        Icon(icon, size: 25),
        Text(
          suhu,
          style: TextStyle(fontSize: 25),
        ), // Text
      ],
    ), // Column
  ); // Container
}
