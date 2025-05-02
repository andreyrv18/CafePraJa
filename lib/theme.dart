import 'package:flutter/material.dart';

final ThemeData cafePraJaTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF5C3A2E),
    onPrimary: Colors.white,
    secondary: Color(0xFFDAB79E),
    onSecondary: Colors.black,
    error: Colors.red.shade700,
    onError: Colors.white,
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF3B2E2A),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(color: Color(0xff2F4B4E), fontFamily: "Serif"),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFF3B2E2A),
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF5C3A2E),
    ),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF3B2E2A)),
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xFF5C3A2E),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor:
        Colors
            .transparent, // Torna o fundo transparente para exibir o gradiente
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: CardTheme(
    color: Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 2,
    margin: EdgeInsets.all(8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF5C3A2E),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: Color(0xff989898)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFF1E8),
    selectedItemColor: Color(0xffC67C4E),
    unselectedItemColor: Color(0xffB7B7B7),
    selectedIconTheme: IconThemeData(size: 38),
  ),
);
