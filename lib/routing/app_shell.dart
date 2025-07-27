import 'package:cafe_pra_ja/routing/navigation_bottom_bar_widget.dart';
import 'package:cafe_pra_ja/ui/ui/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  void _switchBranchOnTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: NavigationBottomBarWidget(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _switchBranchOnTap,
      ),
      body: widget.navigationShell,
    );
  }
}
