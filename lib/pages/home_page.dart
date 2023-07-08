import 'package:counter_on_steroid/pages/surprise_page.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = const Color(0xFF121212);
  int _counter = 0;

  void _incrementCounter() {
    if (_counter % 10 == 9 && _counter != 0) {
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          'Remember, I didn\'t say which button to click!',
          style: TextStyle(
            fontSize: 16,
            color: mainColor,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.amber,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: CustomAppBar(mainColor: mainColor),
      body: body(),
      floatingActionButton: floatingButton(),
    );
  }

  Center body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Just push the button, you have a surprise!',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () => {
              _counter < 10
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          'Too early',
                          style: TextStyle(
                            fontSize: 16,
                            color: mainColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.amber,
                        duration: const Duration(seconds: 3),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurprisePage(
                          counted: _counter,
                        ),
                      ),
                    )
            },
            onDoubleTap: () => {
              setState(() {
                _counter = 0;
              })
            },
            child: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text('$_counter',
                    style: TextStyle(
                      fontSize: 40,
                      color: mainColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialButton floatingButton() {
    return MaterialButton(
      onPressed: _incrementCounter,
      color: Colors.amber,
      elevation: 0.0,
      minWidth: 0,
      height: 0,
      padding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Icon(
        Icons.add,
        size: 30,
        color: mainColor,
      ),
    );
  }
}
