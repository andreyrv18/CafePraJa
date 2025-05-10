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
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 315,
            child: TextField(
              decoration: InputDecoration(
                hintStyle: theme.textTheme.labelMedium,
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.onSurface,
                ),
                hintText: "Encontre seu café favorito",
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(height: 24, child: CafeListView()),
        Expanded(
          child: SizedBox(
            child: Card(
              color: theme.colorScheme.surface,
              child: Text(
                "Cards Aqui",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
