import 'package:cafe_pra_ja/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Pra Já',

      theme: cafePraJaTheme,
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Transform.translate(offset: const Offset(0, -25), child: TextField()),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF313131), Color(0xFF131313)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: Transform.translate(
          offset: const Offset(0, -25), // Move o conteúdo 25 pixels para cima
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("localização", style: TextStyle(color: Colors.white)),
                    Text(
                      "Pinhais, Paraná",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44,
                  width: 44,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    "assets/images/bemvindo.jpg",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
