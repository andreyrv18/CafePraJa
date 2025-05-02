import 'package:cafe_pra_ja/theme.dart';
import 'package:flutter/material.dart';

class CafeListView extends StatefulWidget {
  const CafeListView({super.key});

  @override
  State<CafeListView> createState() => _CafeListViewState();
}

class _CafeListViewState extends State<CafeListView> {
  final List<String> items = [
    "cafe",
    "capuchinno",
    "cha",
    "mocha",
    "cafe Frio",
    "gelado",
    "cha amargo",
    "mochazão",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        final item = items[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },

          child: Container(
            width: 120,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffC67C4E) : Colors.transparent,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                item,
                style:
                    isSelected
                        ? cafePraJaTheme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        )
                        : cafePraJaTheme.textTheme.titleMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}

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
