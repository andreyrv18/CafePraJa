import 'package:flutter/material.dart';
import 'package:ultra_coffee/screens/bemvindo.dart';
import 'package:ultra_coffee/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Bemvindo(title: "Bem Vindo"),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const MyApp(),
      },
    ),
  );
}
