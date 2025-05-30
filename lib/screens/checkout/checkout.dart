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
    final adicionarItem = context.watch<CartProvider>();

    if (cartItems.isEmpty) {
      return Center(
        child: Column(children: [const Text("Seu carrinho está vazio.")]),
      );
    }
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index]; // Pega o item atual
        final nomeProduto = item.nomeProduto;
        final precoUnitario = item.precoUnitario;
        final quantidade = item.quantidade;
        return Card(
          margin: EdgeInsets.all(8),
          elevation: 2,
          color: theme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nomeProduto,
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.onSurface,
                      ),
                    ),

                    Text(
                      'Qtd: $quantidade x R\$ $precoUnitario',
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      'R\$ ${(precoUnitario * quantidade).toStringAsFixed(2)}',
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: theme.tertiaryContainer,
                        foregroundColor: theme.onTertiaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        adicionarItem.atualizarQuantidade(
                          item.id,
                          item.quantidade + 1,
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: theme.errorContainer,
                        foregroundColor: theme.onErrorContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        adicionarItem.atualizarQuantidade(
                          item.id,
                          item.quantidade - 1,
                        );
                      },
                      icon: Icon(Icons.remove_shopping_cart_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
