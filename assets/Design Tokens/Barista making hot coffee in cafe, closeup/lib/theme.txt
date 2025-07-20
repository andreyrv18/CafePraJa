import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff572412),
      surfaceTint: Color(0xff8c4e38),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733a26),
      onPrimaryContainer: Color(0xfff6a68c),
      secondary: Color(0xff281307),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff402719),
      onSecondaryContainer: Color(0xffb18d7a),
      tertiary: Color(0xff1f4124),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff365939),
      onTertiaryContainer: Color(0xffa7cea6),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff1f1b19),
      onSurfaceVariant: Color(0xff514440),
      outline: Color(0xff83746f),
      outlineVariant: Color(0xffd5c3bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xffffdbd0),
      onPrimaryFixed: Color(0xff380d01),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff6f3723),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff2c1609),
      secondaryFixedDim: Color(0xffe7bea9),
      onSecondaryFixedVariant: Color(0xff5d4031),
      tertiaryFixed: Color(0xffc4edc3),
      onTertiaryFixed: Color(0xff002108),
      tertiaryFixedDim: Color(0xffa9d1a8),
      onTertiaryFixedVariant: Color(0xff2c4e2f),
      surfaceDim: Color(0xffe1d8d5),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ef),
      surfaceContainer: Color(0xfff5ece9),
      surfaceContainerHigh: Color(0xfff0e6e3),
      surfaceContainerHighest: Color(0xffeae1de),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff572412),
      surfaceTint: Color(0xff8c4e38),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733a26),
      onPrimaryContainer: Color(0xffffdfd5),
      secondary: Color(0xff281307),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff402719),
      onSecondaryContainer: Color(0xffdab19d),
      tertiary: Color(0xff1b3d20),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff365939),
      onTertiaryContainer: Color(0xffd3fdd1),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff14100f),
      onSurfaceVariant: Color(0xff3f3430),
      outline: Color(0xff5d504b),
      outlineVariant: Color(0xff786a65),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xff9d5c46),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff804430),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff876654),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4e3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff517653),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a5d3c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc5c2),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf2ef),
      surfaceContainer: Color(0xfff0e6e3),
      surfaceContainerHigh: Color(0xffe4dbd8),
      surfaceContainerHighest: Color(0xffd9d0cd),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4e1d0b),
      surfaceTint: Color(0xff8c4e38),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733a26),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff281307),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff402719),
      onSecondaryContainer: Color(0xffffe1d2),
      tertiary: Color(0xff103317),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2e5132),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff352a26),
      outlineVariant: Color(0xff534642),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff342f2e),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xff723925),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff562411),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff604333),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff462d1e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2e5132),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff173a1d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb7b5),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8efec),
      surfaceContainer: Color(0xffeae1de),
      surfaceContainerHigh: Color(0xffdbd2d0),
      surfaceContainerHighest: Color(0xffcdc5c2),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb59c),
      surfaceTint: Color(0xffffb59c),
      onPrimary: Color(0xff53210f),
      primaryContainer: Color(0xff733a26),
      onPrimaryContainer: Color(0xfff6a68c),
      secondary: Color(0xffe7bea9),
      onSecondary: Color(0xff442a1c),
      secondaryContainer: Color(0xff402719),
      onSecondaryContainer: Color(0xffb18d7a),
      tertiary: Color(0xffa9d1a8),
      onTertiary: Color(0xff15371b),
      tertiaryContainer: Color(0xff365939),
      onTertiaryContainer: Color(0xffa7cea6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff161311),
      onSurface: Color(0xffeae1de),
      onSurfaceVariant: Color(0xffd5c3bd),
      outline: Color(0xff9d8d88),
      outlineVariant: Color(0xff514440),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1de),
      inversePrimary: Color(0xff8c4e38),
      primaryFixed: Color(0xffffdbd0),
      onPrimaryFixed: Color(0xff380d01),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff6f3723),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff2c1609),
      secondaryFixedDim: Color(0xffe7bea9),
      onSecondaryFixedVariant: Color(0xff5d4031),
      tertiaryFixed: Color(0xffc4edc3),
      onTertiaryFixed: Color(0xff002108),
      tertiaryFixedDim: Color(0xffa9d1a8),
      onTertiaryFixedVariant: Color(0xff2c4e2f),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff3d3836),
      surfaceContainerLowest: Color(0xff110d0c),
      surfaceContainerLow: Color(0xff1f1b19),
      surfaceContainer: Color(0xff231f1d),
      surfaceContainerHigh: Color(0xff2d2928),
      surfaceContainerHighest: Color(0xff393432),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c5),
      surfaceTint: Color(0xffffb59c),
      onPrimary: Color(0xff451706),
      primaryContainer: Color(0xffc77e66),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffed4be),
      onSecondary: Color(0xff382012),
      secondaryContainer: Color(0xffae8976),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffbee7bd),
      onTertiary: Color(0xff082c11),
      tertiaryContainer: Color(0xff749a75),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff161311),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffebd8d2),
      outline: Color(0xffc0aea9),
      outlineVariant: Color(0xff9d8d88),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1de),
      inversePrimary: Color(0xff713824),
      primaryFixed: Color(0xffffdbd0),
      onPrimaryFixed: Color(0xff270600),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff5a2714),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff200c03),
      secondaryFixedDim: Color(0xffe7bea9),
      onSecondaryFixedVariant: Color(0xff4a3021),
      tertiaryFixed: Color(0xffc4edc3),
      onTertiaryFixed: Color(0xff001504),
      tertiaryFixedDim: Color(0xffa9d1a8),
      onTertiaryFixedVariant: Color(0xff1b3d20),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff494342),
      surfaceContainerLowest: Color(0xff0a0706),
      surfaceContainerLow: Color(0xff211d1b),
      surfaceContainer: Color(0xff2b2725),
      surfaceContainerHigh: Color(0xff363230),
      surfaceContainerHighest: Color(0xff423d3b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece7),
      surfaceTint: Color(0xffffb59c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaf95),
      onPrimaryContainer: Color(0xff1d0400),
      secondary: Color(0xffffece4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe3baa6),
      onSecondaryContainer: Color(0xff180601),
      tertiary: Color(0xffd2fbd0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa5cda4),
      onTertiaryContainer: Color(0xff000f02),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff161311),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece6),
      outlineVariant: Color(0xffd1bfb9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1de),
      inversePrimary: Color(0xff713824),
      primaryFixed: Color(0xffffdbd0),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff270600),
      secondaryFixed: Color(0xffffdbca),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe7bea9),
      onSecondaryFixedVariant: Color(0xff200c03),
      tertiaryFixed: Color(0xffc4edc3),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa9d1a8),
      onTertiaryFixedVariant: Color(0xff001504),
      surfaceDim: Color(0xff161311),
      surfaceBright: Color(0xff544f4d),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f1d),
      surfaceContainer: Color(0xff342f2e),
      surfaceContainerHigh: Color(0xff3f3a39),
      surfaceContainerHighest: Color(0xff4b4644),
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
