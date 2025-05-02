import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/screens/bemvindo.dart';
import 'package:cafe_pra_ja/screens/home.dart';
import 'package:cafe_pra_ja/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: cafePraJaTheme,
      home: const Bemvindo(title: "Bem Vindo"),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const MyApp(),
      },
    ),
  );
}
