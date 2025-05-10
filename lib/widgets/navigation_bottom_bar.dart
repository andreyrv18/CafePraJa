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
      appBar: AppBar(title: const Text("Notificações")),
      body: const Center(child: Text("Página de Notificações")),
    ),
    Scaffold(
      appBar: AppBar(title: const Text("Mensagens")),
      body: const Center(child: Text("Página de Mensagens")),
    ),
    Scaffold(appBar: AppBar(title: const Text("Perfil")),
    body: Perfil()),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_sharp),
            label: "Home",
            backgroundColor: theme.colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications_sharp),
            label: "Notificações",
            backgroundColor: theme.colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            activeIcon: Icon(Icons.messenger_sharp),
            label: "Mensagens",
            backgroundColor: theme.colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_sharp),
            label: "Perfil",
            backgroundColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
