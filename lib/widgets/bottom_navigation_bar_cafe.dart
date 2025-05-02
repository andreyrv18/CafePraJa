import 'package:flutter/material.dart';

class BottomNavigationBarCafe extends StatefulWidget {
  const BottomNavigationBarCafe({super.key});
  @override
  State<BottomNavigationBarCafe> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarCafe> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
    Text('Index 3: Settings', style: optionStyle),
  ];
  int _selectedIndex = 0;
  //  backgroundColor: Color(0xFFFFF1E8),
  //       selectedItemColor: Color(0xffC67C4E),
  //       unselectedItemColor: Color(0xffB7B7B7),
  //       selectedIconTheme: IconThemeData(size: 38),
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: IconTheme(
        data: IconThemeData(color: Color(0xffB7B7B7)),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_outlined, color: Color(0xffB7B7B7)),
              tooltip: "Pagína Inicial",
              onPressed: () {},
            ),
            IconButton(
              tooltip: "Carrinho de compras",
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Color(0xffB7B7B7),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

/* 
 BottomNavigationBar(
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
          Color(0xffC67C4E),
      unselectedItemColor:
           Color(0xffB7B7B7),,
      onTap: _onItemTapped,
    );
*/
