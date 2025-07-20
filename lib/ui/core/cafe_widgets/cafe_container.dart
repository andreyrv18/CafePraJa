import 'package:cafe_pra_ja/config/context_extensions.dart';
import 'package:cafe_pra_ja/ui/core/cafe_widgets/cafe_text.dart';
import 'package:flutter/material.dart';

class CafeContainer<T> extends StatelessWidget {
  const CafeContainer({super.key,
    required this.isSelected,
    required this.name,
});

  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color:
        isSelected ? context.theme.primary : context.theme.surfaceDim,
        border: Border.all(
          color:
          isSelected
              ? Colors.transparent
              : context.theme.outlineVariant,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: CafeText(name: name, isSelected: isSelected,)
    );
  }

}