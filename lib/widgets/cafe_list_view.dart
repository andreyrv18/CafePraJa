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
