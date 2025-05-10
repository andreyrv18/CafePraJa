import 'package:cafe_pra_ja/widgets/list_view_cafe.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: corpo(context),
    );
  }

  Column corpo(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 315,
            child: TextField(
              decoration: InputDecoration(
                hintStyle: textTheme.labelMedium,
                prefixIcon: Icon(Icons.search, color: theme.onSurface),
                hintText: "Encontre seu café favorito",
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(height: 24, child: CafeListView()),
        list(theme, textTheme),
      ],
    );
  }

  Card list(ColorScheme theme, TextTheme textTheme) {
    return Card(
      color: theme.surface,
      child: Text(
        "Cards Aqui",
        style: textTheme.titleLarge?.copyWith(color: theme.onSurface),
      ),
    );
  }
}
