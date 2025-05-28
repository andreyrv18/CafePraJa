import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/database_firestore/database_service.dart';

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

    return Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () async {
              await DatabaseService().getCardapioCompleto();
            },
            child: Text("Ler cardapio"),
          ),
        ),
      ],
    );
  }
}
