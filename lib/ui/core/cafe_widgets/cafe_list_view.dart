import 'package:cafe_pra_ja/ui/core/cafe_widgets/cafe_container.dart';
import 'package:flutter/material.dart';

class CafeListView<T> extends StatelessWidget  {
  const CafeListView({super.key,
   required this.items,
    required this.tapedItem,
  required this.isSelected,
    required this.name,
});

  final List<T> items;
  final String tapedItem;
  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            tapedItem;
          },
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: CafeContainer(isSelected: isSelected, name: name,)
        );
      },
    );
  }

}