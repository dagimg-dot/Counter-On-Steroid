import 'package:counter_on_steroid/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SurprisePage extends StatefulWidget {
  const SurprisePage({super.key});

  @override
  State<SurprisePage> createState() => _SurprisePageState();
}

class _SurprisePageState extends State<SurprisePage> {
  bool _showSuccessIcon = true;
  final Color mainColor = const Color(0xFF121212);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: CustomAppBar(mainColor: mainColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showSuccessIcon)
              const Icon(
                Icons.check_circle,
                color: Colors.amber,
                size: 100,
              ),
            const SizedBox(height: 20),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                'Congratulations, you have found the surprise!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showSuccessIcon = false;
                });
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  // color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
