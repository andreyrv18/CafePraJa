import 'package:cafe_pra_ja/config/context_extensions.dart';
import 'package:cafe_pra_ja/ui/core/localization/cafe_string.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // final ProductModel? item;
  final int? item;

  const ProductDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('item!.nome'), backgroundColor: context.theme.surfaceContainerHigh, elevation: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                  alignment: Alignment.center,
                  child:
                      // item!.imagemUrl.isEmpty
                    true
                          ? Hero(tag: 'item!.id', child: const Placeholder())
                          : Hero(
                            tag: 'item!.id',
                            child: Image.asset('{item!.imagemUrl}.jpg', fit: BoxFit.cover, width: double.infinity),
                          ),
                ),
              ),
            ),

            const SizedBox(height: 24.0),

            Card(
              elevation: 2,
              color: context.theme.surfaceContainerLow,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'item!.descricao',
                            style: context.textTheme.bodyLarge?.copyWith(color: context.theme.onSurfaceVariant),
                          ),
                          Text(
                            // item!.disponivel
                            true
                                ? CafeString.disponivel : CafeString.indisponivel,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color:
                              // item!.disponivel
                              true
                                  ? Colors.green.shade700 : context.theme.error,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'item!.nome',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.theme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12.0),

                          Text(
                            overflow: TextOverflow.ellipsis,
                            'R\$ {item!.preco.toStringAsFixed(2)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.theme.onSurfaceVariant,
                              fontSize: context.textTheme.titleLarge?.fontSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            // if (item!.disponivel)
            if(true)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primary,
                  foregroundColor: context.theme.onPrimary,
                  minimumSize: const Size(double.infinity, 50),
                  // Botão largo
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  textStyle: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                onPressed: ()  {
                  //    _cartRepository.addOrUpdateItemNoCarrinho(
                  //   item!.id,
                  //   item!.nome,
                  //   item!.preco,
                  //   item!.categoriaId,
                  //   item!.imagemUrl,
                  //   item!.descricao,
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('{item!.nome} ${CafeString.adiconadoAoCarrinho}'),
                      backgroundColor: context.theme.tertiary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.all(10),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: const Text(CafeString.adicionarAoCarrinho),
              ),
          ],
        ),
      ),
    );
  }
}
