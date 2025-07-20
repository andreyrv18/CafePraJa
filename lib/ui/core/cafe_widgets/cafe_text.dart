import 'package:cafe_pra_ja/config/context_extensions.dart';
import 'package:flutter/material.dart';

class CafeText extends StatelessWidget {
  const CafeText({super.key, required this.name, required this.isSelected});

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style:
        isSelected
            ? TextStyle(
          color: context.theme.onPrimary,
          fontSize: context.textTheme.titleMedium?.fontSize,
          fontWeight: context.textTheme.titleMedium?.fontWeight,
        )
            : TextStyle(
          color: context.theme.onSurface,
          fontSize: context.textTheme.titleMedium?.fontSize,
          fontWeight: context.textTheme.titleMedium?.fontWeight,
        ),
      ),
    );
  }
}
