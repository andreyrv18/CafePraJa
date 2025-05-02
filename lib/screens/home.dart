import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/widgets/bottom_navigation_bar_cafe.dart';
import 'package:cafe_pra_ja/widgets/cafe_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Pra Já',
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
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: corpo(),
      bottomNavigationBar: BottomNavigationBarCafe(),
    );
  }

  Column corpo() {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 315,

            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Encontre seu café favorito",
              ),
            ),
          ),
        ),
        SizedBox(height: 13),
        SizedBox(height: 25, child: CafeListView()),
        Expanded(child: SizedBox(child: Text("Fim"))),
      ],
    );
  }
}
