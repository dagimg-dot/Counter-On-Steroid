import 'package:counter_on_steroid/pages/home_page.dart';
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
      title: 'Counter on Steroid',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}
