import 'package:cafe_pra_ja/database_firestore/database_service.dart';
import 'package:flutter/material.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  final DatabaseService _dbService = DatabaseService();
  late Future<List<Map<String, dynamic>>> _cardapioFuture;

  @override
  void initState() {
    super.initState();
    _cardapioFuture = _dbService.getCardapioCompleto();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _cardapioFuture,
      builder: (context, snapshot) {
        final cardapioCompleto = snapshot.data!;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhum Item no Cardápio"));
        }

        return ListView.builder(
          itemCount: cardapioCompleto.length,
          itemBuilder: (context, indexCategoria) {
            final Map<String, dynamic> categoria =
                cardapioCompleto[indexCategoria];

            final String nomeCategoria =
                categoria['nome'] as String? ?? "Categoria sem nome";

            final List<dynamic> itensCategoriaDinamica =
                categoria["itens"] as List<dynamic>? ?? [];

            final List<Map<String, dynamic>> itensDaCategoria =
                itensCategoriaDinamica
                    .whereType<Map<String, dynamic>>()
                    .toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                    itensDaCategoria.map((item) {
                      final String nomeItem =
                          item['nome'] as String? ?? "Item sem nome";
                      final double precoItem =
                          (item['preco'] as num?)?.toDouble() ?? 0.0;

                      return Column(
                        children: [
                          Text(nomeItem),
                          Text("R\$ ${precoItem.toStringAsFixed(2)}"),
                        ],
                      );
                    }).toList(),
              ),
            );
          },
        );
      },
    );
  }
}
