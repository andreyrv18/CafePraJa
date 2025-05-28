import 'package:cafe_pra_ja/database_firestore/database_service.dart';
import 'package:flutter/material.dart';

class CafeListView extends StatefulWidget {
  const CafeListView({super.key});

  @override
  State<CafeListView> createState() => _CafeListViewState();
}

class _CafeListViewState extends State<CafeListView> {
  int selectedIndex = 0;

  final DatabaseService _dbService = DatabaseService();
  late Future<List<Map<String, dynamic>>> _cardapioFuture;

  @override
  void initState() {
    super.initState();
    _fetchCardapioData();
  }

  void _fetchCardapioData() async {
    setState(() {
      _cardapioFuture = _dbService.getCategorias();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return FutureBuilder(
      future: _cardapioFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: (CircularProgressIndicator(
              backgroundColor: theme.secondaryContainer,
            )),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text("Erro ao carregar: ${snapshot.error}"));
        }
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text("Nenhum Item no Cardápio"));
        }

        final cardapioItens = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.only(left: 8),
          itemCount: cardapioItens.length,

          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;

            final item = cardapioItens[index];

            final String nome = item["nome"]?.toString() ?? "sem nome";
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 160,

                decoration: BoxDecoration(
                  color: isSelected ? theme.primary : theme.surfaceDim,
                  border: Border.all(color: theme.onSurface),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      nome,
                      style:
                          isSelected
                              ? TextStyle(color: theme.onPrimary)
                              : TextStyle(color: theme.onSurface),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
