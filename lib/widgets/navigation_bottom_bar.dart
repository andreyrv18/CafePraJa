import 'package:cafe_pra_ja/screens/checkout.dart';
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
      appBar: AppBarWidget(),
      body:  Checkout(),
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
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: theme.onSurface),
            activeIcon: Icon(Icons.home_sharp),
            label: "Home",
            backgroundColor: theme.surfaceDim,
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, color: theme.onSurface),
            activeIcon: Icon(Icons.shopping_bag_sharp),
            label: "Checkout",
            tooltip: "Checkout",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined, color: theme.onSurface),
            activeIcon: Icon(Icons.notifications_active_rounded),
            label: "Notificações",
            tooltip: "Notificações",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, color: theme.onSurface),
            activeIcon: Icon(Icons.person_sharp),
            label: "Perfil",
            tooltip: "Perfil",
          ),
        ],
        selectedIconTheme: IconThemeData(color: theme.onSurfaceVariant),
        selectedItemColor: theme.onSurface,
        unselectedIconTheme: IconThemeData(color: theme.onSurface),
      ),
    );
  }
}
