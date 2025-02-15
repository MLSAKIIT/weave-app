import 'package:flutter/material.dart';
import 'package:weave_app/pages/login.dart';
import 'package:weave_app/pages/signup.dart';
import 'pages/splashScreen.dart';
import 'package:wave_app/pages/reconnect.dart';

void main () {
  runApp( MyApp ());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    routes: {
      '/': (context => SplashScreen),
      '/login': (context) => login(),
      '/signup': (context) => signup(),
      '/reconnect': (context) => ReconnectPage(),
    },
      home: ReconnectPage(),
    );
  }
}
