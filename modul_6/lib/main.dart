import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView.builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ), // ThemData
      home: const MyHomePage(title: 'Demo GridView.builder'),
    ); // MaterialApp
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  // List untuk menyimpan data berita
  List dataGame = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Method untuk request data ke server dengan API FreeToGame
  Future _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('http://www.freetogame.com/api/games'),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        setState(() {
          // simpan hanya 10 data pertama dari API ke List
          dataGame = data.take(20).toList();
        });
      } else {
        throw Exception('Gagal load data dari FreeToGame API');
      }
    } catch (e) {
      print('Error: $e'); 
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text(widget.title)),
      body: ListView.builder(
        itemCount: dataGame.length,
        itemBuilder: (context, index) {
          return _listItem(
            dataGame[index]['thumbnail'] ?? 'https://via.placeholder.com/150',
            dataGame[index]['title'] ?? 'Tidak ada judul',
            dataGame[index]['genre'] ?? 'Tidak ada genre',
            dataGame[index]['release_date'] ?? 'Tidak ada tanggal',
          );
        }
      ), // ListView.builder
    ); // Scaffold
  }
}

Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ), // BoxDecoration
    child: const Text('Baca Info', style: TextStyle(color: Colors.white)),
  ); //Container
}

Container _listItem(String url, String jdudl, String genre, String rilis) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ), // BoxDecoration
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(url, width: 70, height: 70, fit: BoxFit.cover),
        ), // ClipRRect
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jdudl,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // TextStyle
              ), // Text
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ), // Column
                  _tombolBaca()
                ],
              ), // Row
            ],
          ), // Column
        ), // Expanded
      ],
    ), // Row
  ); // Container
}
