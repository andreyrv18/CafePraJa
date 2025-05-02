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
              color:
                  isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surfaceDim,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                item,
                style:
                    isSelected
                        ? TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                        : TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
              ),
            ),
          ),
        );
      },
    );
  }
}
