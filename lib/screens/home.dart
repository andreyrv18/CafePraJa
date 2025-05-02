import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Pinhais',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
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
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Row(
            children: [
              Column(children: [Text("localização"), Text("Pinhais, Paraná")]),
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

      body: Column(children: [

    ],),
    );
  }
}
