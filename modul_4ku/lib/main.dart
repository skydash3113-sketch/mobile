import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light (),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  } // MaterialApp
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Text(
          'Pemutar Musik',
          style: TextStyle(fontSize: 25),
        ), // Text
      ), // Center
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: Colors.black,
        child: Row(
          children: [
            Expanded (
                child: Icon(Icons.shuffle, color: Colors.white, size: 50)
            ), // Expanded
            Expanded (
                child: Icon(Icons.skip_previous, color: Colors.white, size: 50)
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50,)
            ), // Flexible
            Expanded (
                child: Icon(Icons.skip_next, color: Colors.white, size: 50)
            ), // Expanded
            Expanded (
                child: Icon(Icons.repeat, color: Colors.white, size: 50)
            ), // Expanded
          ],
        ), // Row
      ), // Container
    ); // Scaffold
  }
}
