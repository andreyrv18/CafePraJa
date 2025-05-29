import 'package:cafe_pra_ja/services/database_service.dart';
import 'package:flutter/material.dart';

class CafeGridView extends StatefulWidget {
  const CafeGridView({super.key});

  @override
  State<CafeGridView> createState() => _CafeGridViewState();
}

class _CafeGridViewState extends State<CafeGridView> {
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return FutureBuilder(
      future: _cardapioFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Erro ao carregar: ${snapshot.error}"));
        }
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhum Item no Cardápio"));
        }
        final cardapioComCategorias = snapshot.data!;
        List<Map<String, dynamic>> todosOsItens = [];
        for (var categoria in cardapioComCategorias) {
          final List<dynamic> itensDaCategoriaDynamic =
              categoria["itens"] as List<dynamic>? ?? [];
          final List<Map<String, dynamic>> itensDaCategoria =
              itensDaCategoriaDynamic
                  .whereType<Map<String, dynamic>>()
                  .toList();
          todosOsItens.addAll(itensDaCategoria);
        }

        if (todosOsItens.isEmpty) {
          return const Center(
            child: Text("Nenhum item disponível no cardápio."),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          itemCount: todosOsItens.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.80,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemBuilder: (BuildContext context, index) {
            final Map<String, dynamic> item = todosOsItens[index];

            final String nomeItem = item['nome'] as String? ?? "Item sem nome";
            final double precoItem = (item['preco'] as num?)?.toDouble() ?? 0.0;

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: theme.surfaceContainer,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Placeholder(
                    fallbackHeight: 120,
                    color: theme.secondaryContainer,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      nomeItem,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        color: theme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2, // Limita o nome a 2 linhas
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "R\$ ${precoItem.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: theme.onSurfaceVariant,
                            fontSize: textTheme.titleLarge?.fontSize,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: theme.tertiary,
                          foregroundColor: theme.onTertiary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
