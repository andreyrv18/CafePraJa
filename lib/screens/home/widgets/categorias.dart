import 'dart:math' as math;

import 'package:cafe_pra_ja/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriasList extends StatefulWidget {
  const CategoriasList({super.key});

  @override
  State<CategoriasList> createState() => _CategoriasListState();
}

class _CategoriasListState extends State<CategoriasList> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final menuProvider = context.watch<MenuProvider>();
    if (menuProvider.carregandoCardapio && menuProvider.categorias.isEmpty) {
      return const SizedBox(
        height: 50,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final List<Map<String, dynamic>> listaDeCategorias =
        menuProvider.categorias;

    return ListView.builder(
      itemCount: listaDeCategorias.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = listaDeCategorias[index];
        final String categoriaId = item['id'];
        final String nome = item["nome"]?.toString() ?? "Sem nome";
        final isSelected = menuProvider.categoriaSelecionadaId == categoriaId;
        return InkWell(
          onTap: () {
            menuProvider.selecionarCategoria(categoriaId);
          },
          borderRadius: const BorderRadius.all(Radius.circular(10)),

          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: isSelected ? theme.primary : theme.surfaceDim,
              border: Border.all(
                color: isSelected ? Colors.transparent : theme.outlineVariant,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                nome,
                textAlign: TextAlign.center,

                overflow: TextOverflow.ellipsis,

                style:
                    isSelected
                        ? TextStyle(
                          color: theme.onPrimary,
                          fontSize: textTheme.titleMedium?.fontSize,
                          fontWeight: textTheme.titleMedium?.fontWeight,
                        )
                        : TextStyle(
                          color: theme.onSurface,
                          fontSize: textTheme.titleMedium?.fontSize,
                          fontWeight: textTheme.titleMedium?.fontWeight,
                        ),
              ),
            ),
          ),
        );
      },
    );
  }
}
