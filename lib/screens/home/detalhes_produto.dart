import 'package:cafe_pra_ja/models/menu_item_model.dart';
import 'package:cafe_pra_ja/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalhesProduto extends StatelessWidget {
  const DetalhesProduto(this.item, {super.key});
  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final cartProvider = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nome),
        backgroundColor: theme.surfaceContainerHigh,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.secondaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12.0),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.local_cafe_outlined, // Ícone de placeholder
                size: 100,
                color: theme.onSecondaryContainer.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 24.0),
            Text(
              item.nome,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: theme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0),

            Text(
              "R\$ ${item.preco.toStringAsFixed(2)}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.onSurfaceVariant,
                fontSize: textTheme.titleLarge?.fontSize,
              ),
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 2,
              color: theme.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categoria: ${item.categoriaId}",
                      style: textTheme.bodyLarge?.copyWith(
                        color: theme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      item.disponivel
                          ? "Disponível em estoque"
                          : "Indisponível no momento",
                      style: textTheme.bodyLarge?.copyWith(
                        color:
                            item.disponivel
                                ? Colors.green.shade700
                                : theme.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32.0), // Espaço antes do botão

            if (item.disponivel)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primary,
                  foregroundColor: theme.onPrimary,
                  minimumSize: const Size(double.infinity, 50), // Botão largo
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  textStyle: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  cartProvider.adicionarItem(
                    item.id,
                    item.nome,
                    item.preco,
                    item.categoriaId,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item.nome} adicionado ao carrinho!'),
                      backgroundColor: theme.tertiary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.all(10),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: const Text("Adicionar ao Carrinho"),
              ),
          ],
        ),
      ),
    );
  }
}
