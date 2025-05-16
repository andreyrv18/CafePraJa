import 'package:flutter/material.dart';

class CafeListView extends StatefulWidget {
  const CafeListView({super.key});

  @override
  State<CafeListView> createState() => _CafeListViewState();
}

class _CafeListViewState extends State<CafeListView> {
  int selectedIndex = 0;
  List items = [1, 2.3];
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return ListView.builder(
      padding: EdgeInsets.only(left: 8),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        final item = items[index];

        return InkWell(
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
                "item",
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
