import 'package:cafe_pra_ja/models/cart_item_model.dart';
import 'package:cafe_pra_ja/screens/cupons.dart';
import 'package:cafe_pra_ja/screens/checkout/checkout.dart';
import 'package:cafe_pra_ja/screens/home/my_home_page.dart';
import 'package:cafe_pra_ja/screens/perfil.dart';
import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cupons_item_model.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    Scaffold(appBar: AppBarWidget(), body: MyHomePage(title: "Home")),
    Scaffold(appBar: AppBarWidget(), body: Checkout()),
    Scaffold(appBar: AppBarWidget(), body: PaginaCupons()),
    Scaffold(body: Perfil()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

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

    return Scaffold(
      body: pages[currentPageIndex],

      bottomNavigationBar: NavigationBar(
        elevation: 5,
        indicatorColor: theme.tertiaryContainer,
        selectedIndex: currentPageIndex,
        backgroundColor: theme.surfaceContainerHigh,
        onDestinationSelected: _onItemTapped,
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
      ),
    );
  }
}
