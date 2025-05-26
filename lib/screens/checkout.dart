import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              width: 100,
              height: 100,
              "assets/images/list.jpg",
              fit: BoxFit.cover,
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
                "R\$ 22",
                style: TextStyle(
                  color: theme.onPrimaryContainer,
                  fontSize: textTheme.titleLarge?.fontSize,
                ),
              ),
            ],
          ),
        ),
        FloatingActionButton(
          tooltip: "Finalizar Compra",
          elevation: 2,
          onPressed: () {},
          backgroundColor: theme.secondary,
          child: Icon(Icons.add, color: theme.onSecondary),
        ),
      ],
    );
  }
}
