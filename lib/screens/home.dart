import 'package:cafe_pra_ja/widgets/list_view_cafe.dart';
import 'package:flutter/material.dart';

final List<int> _items = List<int>.generate(51, (int index) => index);

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
        SizedBox(height: 12),
        Expanded(child: list(theme, textTheme)),
      ],
    );
  }

  GridView list(ColorScheme theme, TextTheme textTheme) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: _items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: theme.surfaceContainerHighest,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "assets/images/list.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Item $index",
                  style: TextStyle(
                    color: theme.onPrimaryContainer,
                    fontSize: textTheme.bodyLarge?.fontSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "R\$ $index",
                      style: TextStyle(
                        color: theme.onPrimaryContainer,
                        fontSize: textTheme.titleLarge?.fontSize,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.secondary,
                      ),
                      child: Icon(Icons.add, color: theme.onSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
