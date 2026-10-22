import 'screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tujuan extends StatelessWidget {
  const Tujuan({super.key});
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF99A29),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F8FB),
                    borderRadius: BorderRadius.circular(8),
                  ), // BoxDecoration
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(args.cover, fit: BoxFit.cover),
                      ), // ClipRRect
                      const SizedBox(height: 15),
                      Text(
                        args.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 47, 72),
                        ), // TextStyle
                      ), // Text
                      const SizedBox(height: 10),
                      Text(
                        args.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 47, 72),
                        ), // Textstyle
                      ), // Text
                      const SizedBox(height: 25),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0081C9),
                                borderRadius: BorderRadius.circular(8),
                              ), // BoxDecoration
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ), // EdgeInsets.symmetric
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 15,
                                    color: Color(0xFFF4F8FB),
                                  ), // Icon
                                  SizedBox(width: 5),
                                  Text(
                                    'Kembali ke game',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFF4F8FB),
                                    ), // TextStyle
                                  ), // Text
                                ],
                              ), // Row
                            ), // Container
                          ), // GestureDetector
                        ],
                      ), // Row
                    ],
                  ), // Column
                ), // Container
              ],
            ), // Column
          ), // Container
        ), // SingleChildScrollView
      ), // SafeArea
    ); // Scaffold
  }
}