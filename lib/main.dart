import 'package:flutter/material.dart';
import 'forgot_password_3.dart';  
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ForgotPassword3(), 
    );
  }
}
