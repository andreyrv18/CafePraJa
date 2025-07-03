import 'package:cafe_pra_ja/navigation/navigation_bottom_bar.dart';
import 'package:cafe_pra_ja/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _switchBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: navigationShell.currentIndex,
        onTap: _switchBranch,
      ),
      body: navigationShell,
    );
  }
}
