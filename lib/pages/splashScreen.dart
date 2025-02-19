import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/icons/Splash_screen3.png',
            fit: BoxFit.cover,
          ))
        ],
      ),
    );
  }
}
