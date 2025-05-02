import 'package:cafe_pra_ja/theme.dart';
import 'package:flutter/material.dart';

class CafeBottomNavigationBar extends StatefulWidget {
  const CafeBottomNavigationBar({super.key});
  @override
  State<CafeBottomNavigationBar> createState() =>
      _CafeBottomNavigationBarState();
}

class _CafeBottomNavigationBarState extends State<CafeBottomNavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout),
          label: "checkout",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorito"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:
          cafePraJaTheme.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          cafePraJaTheme.bottomNavigationBarTheme.unselectedItemColor,
      onTap: _onItemTapped,
    );
  }
}
