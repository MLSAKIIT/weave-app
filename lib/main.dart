import 'package:flutter/material.dart';
// import 'package:splash_screen/pages/splashScreen.dart';

import 'pages/splashScreen.dart';

void main () {
  runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
