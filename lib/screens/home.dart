import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:cafe_pra_ja/widgets/list_view_cafe.dart';
import 'package:cafe_pra_ja/widgets/navigation_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBarWidget(),
      body: corpo(context),
      bottomNavigationBar: NavigationBottomBar(),
    );
  }

  Column corpo(context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 315,
            child: TextField(
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.labelMedium,
                prefixIcon: Icon(Icons.search),
                hintText: "Encontre seu café favorito",
              ),
            ),
          ),
        ),
        SizedBox(height: 13),
        SizedBox(height: 25, child: CafeListView()),
        Expanded(
          child: SizedBox(
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              child: Text(
                "Cards Aqui",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
