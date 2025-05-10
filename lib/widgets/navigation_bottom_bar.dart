import 'package:cafe_pra_ja/screens/home.dart';
import 'package:cafe_pra_ja/screens/perfil.dart';
import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    Scaffold(appBar: AppBarWidget(), body: MyHomePage(title: "Home")),
    Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: const Center(child: Text("Página de Checkout")),
    ),
    Scaffold(
      appBar: AppBar(title: const Text("Notificações")),
      body: const Center(child: Text("Página de Notificações")),
    ),
    Scaffold(appBar: AppBar(title: const Text("Perfil")), body: Perfil()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: pages[currentPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: theme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_checkout_outlined),
            label: "Checkout",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications_active_rounded),
            label: "Notificações",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_4_sharp),
            label: "Perfil",
          ),
        ],
        selectedIconTheme: IconThemeData(color: theme.onPrimary),
      ),
    );
  }
}
