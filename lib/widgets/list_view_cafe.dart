import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class CafeListView extends StatefulWidget {
  const CafeListView({super.key});

  @override
  State<CafeListView> createState() => _CafeListViewState();
}

class _CafeListViewState extends State<CafeListView> {
  Map<String, dynamic>? cardapio;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCardapio();
  }

  Future<void> loadCardapio() async {
    final String jsonString = await rootBundle.loadString(
      "assets/cardapio.json",
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    setState(() {
      cardapio = jsonMap['cardapio'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    if (cardapio == null) {
      return Center(child: CircularProgressIndicator());
    }

    final List<String> items = cardapio!.keys.toList();

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
            width: 160,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? theme.primary : theme.surfaceDim,
              border: Border.all(color: theme.onSurface),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                item,
                style:
                    isSelected
                        ? TextStyle(color: theme.onPrimary)
                        : TextStyle(color: theme.onSurface),
              ),
            ),
          ),
        );
      },
    );
  }
}
