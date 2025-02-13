import 'package:flutter/material.dart';
import 'package:weave_app/pages/login.dart';
import 'package:weave_app/pages/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => login(),
      '/signup': (context) => signup()
    },
  ));
}
