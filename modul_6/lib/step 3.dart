import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GridView Builder',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataBerita = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  Future<void> _ambilData() async {
    final response = await http.get(
      Uri.parse(
        'https://jakpost.vercel.app/api/category/business/tech',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        dataBerita = data['posts'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView.builder'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: dataBerita.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  dataBerita[index]['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              child: Image.network(
                dataBerita[index]['image'] ??
                    'https://via.placeholder.com/300',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}