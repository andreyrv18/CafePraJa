import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8c4f27),
      surfaceTint: Color(0xff8c4f27),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbc9),
      onPrimaryContainer: Color(0xff6f3812),
      secondary: Color(0xff765847),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbc9),
      onSecondaryContainer: Color(0xff5c4131),
      tertiary: Color(0xff006970),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9df0f9),
      onTertiaryContainer: Color(0xff004f55),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff221a15),
      onSurfaceVariant: Color(0xff52443c),
      outline: Color(0xff85746b),
      outlineVariant: Color(0xffd7c2b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e29),
      inversePrimary: Color(0xffffb68c),
      primaryFixed: Color(0xffffdbc9),
      onPrimaryFixed: Color(0xff321200),
      primaryFixedDim: Color(0xffffb68c),
      onPrimaryFixedVariant: Color(0xff6f3812),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff2b1609),
      secondaryFixedDim: Color(0xffe5bfaa),
      onSecondaryFixedVariant: Color(0xff5c4131),
      tertiaryFixed: Color(0xff9df0f9),
      onTertiaryFixed: Color(0xff002022),
      tertiaryFixedDim: Color(0xff81d4dc),
      onTertiaryFixedVariant: Color(0xff004f55),
      surfaceDim: Color(0xffe7d7cf),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ea),
      surfaceContainer: Color(0xfffceae2),
      surfaceContainerHigh: Color(0xfff6e5dd),
      surfaceContainerHighest: Color(0xfff0dfd7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5a2803),
      surfaceTint: Color(0xff8c4f27),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9d5d34),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff493022),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866655),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003d42),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff167881),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff170f0b),
      onSurfaceVariant: Color(0xff41332c),
      outline: Color(0xff5e4f47),
      outlineVariant: Color(0xff7a6a61),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e29),
      inversePrimary: Color(0xffffb68c),
      primaryFixed: Color(0xff9d5d34),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff80451e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866655),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6b4f3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff167881),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005e65),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd3c3bc),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ea),
      surfaceContainer: Color(0xfff6e5dd),
      surfaceContainerHigh: Color(0xffeadad2),
      surfaceContainerHighest: Color(0xffdfcec7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4c1f00),
      surfaceTint: Color(0xff8c4f27),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff723a14),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3e2718),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5e4333),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003236),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005258),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362923),
      outlineVariant: Color(0xff55463e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e29),
      inversePrimary: Color(0xffffb68c),
      primaryFixed: Color(0xff723a14),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff562500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5e4333),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff452d1e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005258),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00393d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5b6ae),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede5),
      surfaceContainer: Color(0xfff0dfd7),
      surfaceContainerHigh: Color(0xffe2d1c9),
      surfaceContainerHighest: Color(0xffd3c3bc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb68c),
      surfaceTint: Color(0xffffb68c),
      onPrimary: Color(0xff522300),
      primaryContainer: Color(0xff6f3812),
      onPrimaryContainer: Color(0xffffdbc9),
      secondary: Color(0xffe5bfaa),
      onSecondary: Color(0xff432b1c),
      secondaryContainer: Color(0xff5c4131),
      onSecondaryContainer: Color(0xffffdbc9),
      tertiary: Color(0xff81d4dc),
      onTertiary: Color(0xff00363b),
      tertiaryContainer: Color(0xff004f55),
      onTertiaryContainer: Color(0xff9df0f9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120d),
      onSurface: Color(0xfff0dfd7),
      onSurfaceVariant: Color(0xffd7c2b8),
      outline: Color(0xff9f8d84),
      outlineVariant: Color(0xff52443c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd7),
      inversePrimary: Color(0xff8c4f27),
      primaryFixed: Color(0xffffdbc9),
      onPrimaryFixed: Color(0xff321200),
      primaryFixedDim: Color(0xffffb68c),
      onPrimaryFixedVariant: Color(0xff6f3812),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff2b1609),
      secondaryFixedDim: Color(0xffe5bfaa),
      onSecondaryFixedVariant: Color(0xff5c4131),
      tertiaryFixed: Color(0xff9df0f9),
      onTertiaryFixed: Color(0xff002022),
      tertiaryFixedDim: Color(0xff81d4dc),
      onTertiaryFixedVariant: Color(0xff004f55),
      surfaceDim: Color(0xff1a120d),
      surfaceBright: Color(0xff413732),
      surfaceContainerLowest: Color(0xff140d08),
      surfaceContainerLow: Color(0xff221a15),
      surfaceContainer: Color(0xff271e19),
      surfaceContainerHigh: Color(0xff312823),
      surfaceContainerHighest: Color(0xff3d332d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3bc),
      surfaceTint: Color(0xffffb68c),
      onPrimary: Color(0xff421a00),
      primaryContainer: Color(0xffc78053),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcd4bf),
      onSecondary: Color(0xff372013),
      secondaryContainer: Color(0xffac8a76),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff97eaf3),
      onTertiary: Color(0xff002b2e),
      tertiaryContainer: Color(0xff479da5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a120d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8ce),
      outline: Color(0xffc2aea4),
      outlineVariant: Color(0xff9f8d83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd7),
      inversePrimary: Color(0xff703913),
      primaryFixed: Color(0xffffdbc9),
      onPrimaryFixed: Color(0xff220a00),
      primaryFixedDim: Color(0xffffb68c),
      onPrimaryFixedVariant: Color(0xff5a2803),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff1f0c03),
      secondaryFixedDim: Color(0xffe5bfaa),
      onSecondaryFixedVariant: Color(0xff493022),
      tertiaryFixed: Color(0xff9df0f9),
      onTertiaryFixed: Color(0xff001416),
      tertiaryFixedDim: Color(0xff81d4dc),
      onTertiaryFixedVariant: Color(0xff003d42),
      surfaceDim: Color(0xff1a120d),
      surfaceBright: Color(0xff4d423d),
      surfaceContainerLowest: Color(0xff0c0604),
      surfaceContainerLow: Color(0xff241c17),
      surfaceContainer: Color(0xff2f2621),
      surfaceContainerHigh: Color(0xff3a312b),
      surfaceContainerHighest: Color(0xff463b36),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece3),
      surfaceTint: Color(0xffffb68c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb182),
      onPrimaryContainer: Color(0xff190600),
      secondary: Color(0xffffece3),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe1bba6),
      onSecondaryContainer: Color(0xff180701),
      tertiary: Color(0xffc5f9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7dd0d8),
      onTertiaryContainer: Color(0xff000e0f),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a120d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece3),
      outlineVariant: Color(0xffd3bfb4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff0dfd7),
      inversePrimary: Color(0xff703913),
      primaryFixed: Color(0xffffdbc9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb68c),
      onPrimaryFixedVariant: Color(0xff220a00),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe5bfaa),
      onSecondaryFixedVariant: Color(0xff1f0c03),
      tertiaryFixed: Color(0xff9df0f9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff81d4dc),
      onTertiaryFixedVariant: Color(0xff001416),
      surfaceDim: Color(0xff1a120d),
      surfaceBright: Color(0xff594e48),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271e19),
      surfaceContainer: Color(0xff382e29),
      surfaceContainerHigh: Color(0xff443934),
      surfaceContainerHighest: Color(0xff4f453f),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
