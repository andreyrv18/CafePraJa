import 'package:cafe_pra_ja/screens/home.dart';
import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    MyHomePage(title: "Home"),
    Center(child: Text("Notifications Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Messages Page", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: pages[currentPageIndex], // Exibe a página correspondente
        ),
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index; // Atualiza o índice da página
            });
          },
          indicatorColor: theme.colorScheme.secondaryContainer,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home_sharp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              label: "Home",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.notifications_sharp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              icon: Icon(
                Icons.notifications_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              label: "Notifications",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.messenger_sharp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
              icon: Icon(
                Icons.messenger_outline,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              label: "Messages",
            ),
          ],
        ),
      ],
    );
  }
}
