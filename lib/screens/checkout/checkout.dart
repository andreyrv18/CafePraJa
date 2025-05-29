import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<CartItemModel> cartItems = context.watch<List<CartItemModel>>();
    return Column(
      children: [
        Card(
          color: theme.tertiary,
          child: ListView.builder(
            itemBuilder: (context, item) {
              final nomeProduto = cartItems[item].nomeProduto;
              final precoUnitario = cartItems[item].precoUnitario;
              return ListTile(
                title: Text(
                  nomeProduto,
                  style: TextStyle(fontSize: textTheme.titleMedium?.fontSize),
                ),
                subtitle: Text(precoUnitario.toStringAsFixed(2)),
              );
            },
          ),
        ),
      ],
    );
  }
}
