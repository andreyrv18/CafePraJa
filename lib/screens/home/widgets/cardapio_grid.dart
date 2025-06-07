import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:cafe_pra_ja/screens/home/detalhes_produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardapioGrid extends StatefulWidget {
  const CardapioGrid({super.key});

  @override
  State<CardapioGrid> createState() => _CardapioGridState();
}

class _CardapioGridState extends State<CardapioGrid> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);

      if (menuProvider.todosOsItensDoCardapioDEBUG.isEmpty &&
          !menuProvider.carregandoCardapio) {
        menuProvider.carregarItensDoCardapio();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final menuProvider = context.watch<MenuProvider>();
    final addCart = context.watch<CartProvider>();

    if (menuProvider.errorMessage != null) {
      return Center(child: Text('Erro: ${menuProvider.errorMessage}'));
    }
    if (menuProvider.carregandoCardapio &&
        menuProvider.itensFiltradosDoCardapio.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    final List<MenuItemModel> itensParaExibir =
        menuProvider.itensFiltradosDoCardapio;

    if (itensParaExibir.isEmpty && !menuProvider.carregandoCardapio) {
      return Center(
        child: Text(
          menuProvider.termoDeBuscaCardapio.isEmpty
              ? 'Nenhum item encontrado no cardápio.'
              : 'Nenhum item encontrado para "${menuProvider.termoDeBuscaCardapio}".',
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            itemCount: itensParaExibir.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, index) {
              final MenuItemModel item = itensParaExibir[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesProduto(item),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: theme.surfaceContainer,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child:
                            item.imagemUrl.isEmpty
                                ? const Center(child: Placeholder())
                                : Image.asset(
                                  "${item.imagemUrl}.jpg",
                                  fit: BoxFit.cover,
                                ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            item.nome,
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge?.copyWith(
                              color: theme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, // Limita o nome a 2 linhas
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$ ${item.preco.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: theme.onSurfaceVariant,
                              fontSize: textTheme.titleLarge?.fontSize,
                            ),
                          ),
                          FloatingActionButton(
                            shape: BeveledRectangleBorder(),
                            tooltip: "Comprar",

                            backgroundColor: theme.tertiary,
                            foregroundColor: theme.onTertiary,
                            child: Icon(Icons.add_shopping_cart_outlined),
                            onPressed: () {
                              addCart.adicionarItem(
                                item.id,
                                item.nome,
                                item.preco,
                                item.categoriaId,
                                item.imagemUrl,
                                item.descricao,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
