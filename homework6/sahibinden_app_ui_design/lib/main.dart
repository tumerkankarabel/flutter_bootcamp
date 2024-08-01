import 'package:flutter/material.dart';
import 'package:sahibinden_app_ui_design/homepage.dart';

void main() {
  runApp(SahibindenApp());
}

class SahibindenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahibinden',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
