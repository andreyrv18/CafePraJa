import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<CartItemModel> cartItems = context.watch<List<CartItemModel>>();
    final maisItem = context.watch<CartProvider>();
    if (cartItems.isEmpty) {
      return Center(
        child: Column(children: [const Text("Seu carrinho está vazio.")]),
      );
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index]; // Pega o item atual
              final nomeProduto = item.nomeProduto;
              final precoUnitario = item.precoUnitario;
              final quantidade = item.quantidade;
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      nomeProduto,
                      style: textTheme.titleMedium?.copyWith(
                        color: theme.onSurface,
                      ),
                    ),
                    subtitle: Text('Qtd: $quantidade x R\$ $precoUnitario'),
                    trailing: Text(
                      'R\$ ${(precoUnitario * quantidade).toStringAsFixed(2)}',
                      style: textTheme.titleSmall?.copyWith(
                        color: theme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          maisItem.atualizarQuantidade(
                            item.id,
                            item.quantidade + 1,
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          maisItem.atualizarQuantidade(
                            item.id,
                            item.quantidade - 1,
                          );
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
