import 'package:flutter/material.dart';
import 'package:ultra_coffee/screens/bemvindo.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Bemvindo(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const MyApp(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("main"));
  }
}
