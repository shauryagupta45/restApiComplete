import 'package:flutter/material.dart';
import 'package:rest_api_project/home_screen1.dart';
import 'package:rest_api_project/home_screen2.dart';
import 'package:rest_api_project/home_screen3.dart';

import 'home_screen4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen4(),
    );
  }
}
