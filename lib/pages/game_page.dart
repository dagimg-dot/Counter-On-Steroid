import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import 'home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.counted}) : super(key: key);

  final int counted;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Color mainColor = const Color(0xFF121212);
  int _currentNumber = 2;
  int score = 0;
  List<int> scores = [];

  bool isCorrect(int currNum) {
    return widget.counted % currNum == 0 ? true : false;
  }

  int calCounted(int num) {
    return num - 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: CustomAppBar(
        mainColor: mainColor,
        action: IconButton(
          onPressed: () {
            showCloseDialog(context);
          },
          icon: const Icon(Icons.home_filled),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Is $_currentNumber a factor of ${widget.counted}?',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (widget.counted != _currentNumber) {
                      bool isFactor = isCorrect(_currentNumber);
                      if (isFactor) {
                        score += 1;
                      }
                      setState(() {
                        _currentNumber += 1;
                      });
                    } else {
                      showGameOverDialog(context);
                    }
                  },
                  child: const Text('Yes'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (widget.counted != _currentNumber) {
                      bool isFactor = isCorrect(_currentNumber);
                      if (!isFactor) {
                        score += 1;
                      }
                      setState(() {
                        _currentNumber += 1;
                      });
                    } else {
                      showGameOverDialog(context);
                    }
                  },
                  child: const Text('No'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Scores',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'High Score: ${scores.isNotEmpty ? scores.reduce(max) : 0}',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: scores.length,
              itemBuilder: (BuildContext context, int index) {
                return customListTile(index);
              },
            ))
          ],
        ),
      ),
    );
  }

  Container customListTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 8,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          tileColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            '${scores[index]} / ${calCounted(widget.counted)}',
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            scores[index] > widget.counted / 2 ? Icons.check : Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<dynamic> showGameOverDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('Game Over!'),
          content: Text(
            'Your score is $score / ${calCounted(widget.counted)}. \n\nDo you want to play again?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                scores.add(score);
                setState(() {
                  _currentNumber = 2;
                  score = 0;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: const Text('No'),
            ),
          ]),
    );
  }

  Future<dynamic> showCloseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('Are you sure?'),
          content: const Text(
            'You will lose all your progress!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: mainColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: mainColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
