import 'package:flutter/material.dart';
import 'package:sanrachna_web/views/pages/home_page.dart';

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sanrachna",
      home: HomePage(),
    );
  }
}
