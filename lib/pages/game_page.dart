import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.counted});

  final int counted;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body: Center(
        child: Text('${widget.counted}'),
      ),);
  }
}