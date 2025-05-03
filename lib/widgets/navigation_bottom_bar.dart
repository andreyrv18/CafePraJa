import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: theme.colorScheme.surface,
        onDestinationSelected:
            (int index) => {
              setState(() {
                currentPageIndex = index;
              }),
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
            selectedIcon: Badge(
              child: Icon(
                Icons.notifications_sharp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            icon: Badge(
              child: Icon(
                Icons.notifications_outlined,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            label: "Notifications",
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.messenger_sharp,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.messenger_outline,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            label: "messages",
          ),
        ],
      ),
    );
  }
}
