import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
        ), // AppBar
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  kotakIkon(
                    warnaKotak: Colors.orange,
                    icon: Icons.thumb_up,
                    warnaIcon: Colors.blue,
                    label: "Like",
                  ), // kotakIkon
                  SizedBox(width: 30),
                  kotakIkon(
                    warnaKotak: Colors.blue,
                    icon: Icons.favorite,
                    warnaIcon: Colors.red,
                    label: "Love",
                  ),
                ],
              ), // Row
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  kotakIkon(
                    warnaKotak: Colors.red,
                    icon: Icons.star,
                    warnaIcon: Colors.yellow,
                    label: "Stars",
                  ), // kotakIkon
                  SizedBox(width: 30),
                  kotakIkon(
                    warnaKotak: Colors.black,
                    icon: Icons.comment,
                    warnaIcon: Colors.white,
                    label: "Comment",
                  ), // kotakIkon
                ],
              ) // Row
            ],
          ), // Column
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}

class kotakIkon extends StatelessWidget {
  final Color warnaKotak;
  final IconData icon;
  final Color warnaIcon;
  final String label;

  const kotakIkon({
    super.key,
    required this.warnaKotak,
    required this.icon,
    required this.warnaIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: warnaKotak,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(25),
          ), // BoxDecoration
          child: Icon(
            icon,
            color: warnaIcon,
            size: 50,
          ), // Icon
        ), // Container
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ), // Text
      ],
    ); // Column
  }
}
