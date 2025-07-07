import 'package:cafe_pra_ja/domain/models/cupons_item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CuponsScreen extends StatelessWidget {
  const CuponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CuponsItemModel> cupons = context.watch<List<CuponsItemModel>>();
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
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

    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.outlineVariant,
        body: ListView.builder(
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
                subtitle: Text(
                  cupom.descricao,
                  style: TextStyle(
                    fontSize: textTheme.titleSmall?.fontSize,
                    color: theme.onSurfaceVariant,
                  ),
                ),
                trailing: Text(
                  '${cupom.porcentagem}% OFF',
                  style: TextStyle(
                    color: theme.tertiary,
                    fontWeight: FontWeight.bold,
                    fontSize: textTheme.bodyLarge?.fontSize,
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Cupom ${cupom.codigo} selecionado!"),
                      backgroundColor: theme.primary,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
