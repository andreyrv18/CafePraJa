import 'package:flutter/material.dart';

extension ThemeShortcuts on BuildContext {
  /// Acesso rápido a Theme.of(context).
  ThemeData get themeT => Theme.of(this);

  /// Acesso rápido a Theme.of(context).colorScheme.
  ColorScheme get theme => themeT.colorScheme;

  /// Acesso rápido a Theme.of(context).textTheme.
  TextTheme get textTheme => themeT.textTheme;
}
