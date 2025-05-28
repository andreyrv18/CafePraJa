import 'package:cafe_pra_ja/screens/home/widgets/cafe_grid_view.dart';
import 'package:cafe_pra_ja/screens/home/widgets/cardapio.dart';
import 'package:cafe_pra_ja/screens/home/widgets/list_view_cafe.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Encontre seu café favorito!"),
                hintStyle: textTheme.labelMedium,
                hint: Text("Ex: Espresso, Cappuccino, Arábica..."),
                prefixIcon: Icon(Icons.search, color: theme.onSurface),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(height: 48, child: CafeListView()),
          SizedBox(height: 12),
          Expanded(child: CafeGridView()),
        ],
      ),
    );
  }
}
