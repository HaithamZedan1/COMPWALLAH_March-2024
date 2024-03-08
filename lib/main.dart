import 'package:calculator/view/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calculator App',
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

