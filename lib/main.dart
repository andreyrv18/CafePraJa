import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/screens/bemvindo.dart';
import 'package:cafe_pra_ja/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const Bemvindo(title: "Bem Vindo"),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const MyApp(),
      },
    ),
  );
}
