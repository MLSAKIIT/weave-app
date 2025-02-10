import 'package:flutter/material.dart';
import 'pages/reset_password.dart';
import 'pages/reset_link_sent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weave',
      home: Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }
}
