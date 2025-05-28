import 'package:cafe_pra_ja/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    var appState = context.watch<ApplicationState>();

    if (appState.cartList.isEmpty) {
      return Center(child: Text("Carrinho de compras vazio"));
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: appState.cartList.length,
            itemBuilder: (BuildContext context, int index) {
              var cartItem = appState.cartList[index];

              return Column(
                children: [
                  Text("nome "),
                  IconButton(
                    onPressed: () async {
                      // await DatabaseService().getCardapioCompleto();
                      appState.shoppingCart(cartItem);
                    },
                    icon: Icon(Icons.remove_shopping_cart),
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
