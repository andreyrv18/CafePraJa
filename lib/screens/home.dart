import 'package:cafe_pra_ja/theme.dart';
import 'package:flutter/material.dart';

List<String> items = ["cafe", "capuchinno", "cha", "mocha"];

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
      backgroundColor: cafePraJaTheme.bottomNavigationBarTheme.backgroundColor,
      appBar: appBar(),
      body: corpo(),
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
        SizedBox(
          height: 55,
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item,
                    style: cafePraJaTheme.textTheme.titleMedium,
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(child: SizedBox(child: Text("Fim"))),
      ],
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
        preferredSize: const Size.fromHeight(20.0),
        child: Transform.translate(
          offset: const Offset(0, -10), // Move o conteúdo 25 pixels para cima
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "localização",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Sora",
                      ),
                    ),
                    Text(
                      "Pinhais, Paraná",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "Sora",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44,
                  width: 44,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 44,
                    ),
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
