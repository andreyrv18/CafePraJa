import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cupons_item_model.dart';

class PaginaCupons extends StatelessWidget {
  const PaginaCupons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CuponsItemModel> cupons = context.watch<List<CuponsItemModel>>();
    final ColorScheme theme = Theme.of(context).colorScheme;

    if (cupons.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Nenhum cupom disponível no momento.",
            style: TextStyle(color: theme.onSurfaceVariant),
          ),
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cupons.length,
            itemBuilder: (context, index) {
              final CuponsItemModel cupom = cupons[index];

              return Card(
                elevation: 2,
                color: theme.surfaceContainerHighest,

                child: ListTile(
                  leading: Icon(Icons.local_offer, color: theme.primary),
                  title: Text(
                    cupom.codigo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.onSurface,
                    ),
                  ),

                  trailing: Text(
                    '${cupom.porcentagem}% OFF',
                    style: TextStyle(
                      color: theme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    print('Cupom selecionado: ${cupom.codigo} (${cupom.id})');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
