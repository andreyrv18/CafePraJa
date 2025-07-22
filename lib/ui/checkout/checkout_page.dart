import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final List<CartItemModel> cartItems = context.watch<List<CartItemModel>>();

    // if (cartItems.isEmpty) {
    //   return Center(
    //     child: Column(children: [const Text(CafeString.seuCarrinhoEstaVazio)]),
    //   );
    // }
    return ListView.builder(
      // itemCount: cartItems.length,
      itemCount: 11,
      itemBuilder: (context, index) {
        // final item = cartItems[index]; // Pega o item atual
        // final nomeProduto = item.nomeProduto;
        // final precoUnitario = item.precoUnitario;
        // final quantidade = item.quantidade;
        // final imagemUrl = item.imagemUrl;
        return Card(
          margin: EdgeInsets.all(8),
          elevation: 2,
          color: theme.surfaceContainerHighest,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expanded(
              //   flex: 3,
              //   child:
              //       // imagemUrl.isEmpty
              // false
              //           ? const Text(CafeString.produtoSemImagem)
              //           : Expanded(child: Image.asset('{item.imagemUrl}.jpg')),
              // ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'nomeProduto',
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.onSurface,
                      ),
                    ),

                    Text(
                      'quantidade x ${CafeString.realBR} precoUnitario',
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      overflow:TextOverflow.ellipsis ,
                      '${CafeString.realBR} {(precoUnitario * quantidade).toStringAsFixed(2)}',
                      style: textTheme.titleLarge?.copyWith(
                        color: theme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            // adicionarItem.atualizarQuantidade(
                            //   item.id,
                            //   item.quantidade + 1,
                            // );
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
                            // adicionarItem.atualizarQuantidade(
                            //   item.id,
                            //   item.quantidade - 1,
                            // );
                          },
                          icon: Icon(Icons.remove_shopping_cart_rounded),
                        ),
                      ],
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
