import 'package:cafe_pra_ja/domain/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/models/cupons_item_model.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final List<CartItemModel> cartItens = context.watch<List<CartItemModel>>();
    final quantidade = cartItens.fold(
      0,
      (acumulador, itemAtual) => acumulador + itemAtual.quantidade,
    );

    final List<CuponsItemModel> listaDeCupons =
        context.watch<List<CuponsItemModel>>();
    final int quantidadeDeCupons = listaDeCupons.length;

    return NavigationBar(
      elevation: 5,
      indicatorColor: theme.tertiaryContainer,
      selectedIndex: currentIndex,
      backgroundColor: theme.surfaceContainerHigh,
      onDestinationSelected: onTap,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.search, color: theme.onSurface),
          selectedIcon: Icon(Icons.search_sharp),
          label: "Pesquisar",
          tooltip: "Pesquisar",
        ),
        NavigationDestination(
          icon: Badge(
            padding: EdgeInsets.all(2),
            label: Text("$quantidade"),
            child: Icon(Icons.shopping_bag_outlined, color: theme.onSurface),
          ),
          selectedIcon: Badge(
            padding: EdgeInsets.all(2),
            label: Text("$quantidade"),
            child: Icon(Icons.shopping_bag_sharp),
          ),
          label: "Checkout",
          tooltip: "Checkout",
        ),
        NavigationDestination(
          icon: Badge(
            padding: EdgeInsets.all(2),
            label: Text("$quantidadeDeCupons"),
            child: Icon(Icons.local_activity_outlined),
          ),
          selectedIcon: Badge(
            padding: EdgeInsets.all(2),
            label: Text("$quantidadeDeCupons"),
            child: Icon(Icons.local_activity),
          ),
          label: "Cupons %",
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          selectedIcon: Icon(Icons.person_sharp),
          label: "Perfil",
        ),
      ],
    );
  }
}
