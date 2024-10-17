import 'package:flutter/material.dart';
import 'package:revision/calculator/calculator.dart';

void main() {
    runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Calculator.routeName:(_)=>Calculator(),
      },
      initialRoute:Calculator.routeName ,
    );
  }
}

