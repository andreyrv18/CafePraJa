import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeGridView extends StatefulWidget {
  const CafeGridView({super.key});

  @override
  State<CafeGridView> createState() => _CafeGridViewState();
}

class _CafeGridViewState extends State<CafeGridView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);
      if (menuProvider.menuItems.isEmpty && !menuProvider.isLoading) {
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
    if (menuProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (menuProvider.menuItems.isEmpty) {
      return const Center(child: Text('Nenhum item encontrado no cardápio.'));
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            itemCount: menuProvider.menuItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.80,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, index) {
              final MenuItemModel item = menuProvider.menuItems[index];

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
                        item.nome,
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
                            item.preco.toStringAsFixed(2),
                            style: TextStyle(
                              color: theme.onSurfaceVariant,
                              fontSize: textTheme.titleLarge?.fontSize,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print(item.nome);
                            addCart.adicionarItem(
                              item.id,
                              item.nome,
                              item.preco,
                              item.categoriaId,
                            );
                          },
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
          ),
        ),
      ],
    );
  }
}
