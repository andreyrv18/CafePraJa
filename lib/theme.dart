import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8f4c35),
      surfaceTint: Color(0xff8f4c35),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdbcf),
      onPrimaryContainer: Color(0xff723520),
      secondary: Color(0xff8c4e28),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdbc9),
      onSecondaryContainer: Color(0xff6f3813),
      tertiary: Color(0xff4d662a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffceeda2),
      onTertiaryContainer: Color(0xff364e15),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff221a14),
      onSurfaceVariant: Color(0xff53433e),
      outline: Color(0xff85736d),
      outlineVariant: Color(0xffd8c2bb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382f28),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff390c00),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff723520),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff331200),
      secondaryFixedDim: Color(0xffffb68e),
      onSecondaryFixedVariant: Color(0xff6f3813),
      tertiaryFixed: Color(0xffceeda2),
      onTertiaryFixed: Color(0xff112000),
      tertiaryFixedDim: Color(0xffb3d089),
      onTertiaryFixedVariant: Color(0xff364e15),
      surfaceDim: Color(0xffe7d7cd),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e9),
      surfaceContainer: Color(0xfffbebe1),
      surfaceContainerHigh: Color(0xfff5e5db),
      surfaceContainerHighest: Color(0xffefe0d6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5d2511),
      surfaceTint: Color(0xff8f4c35),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15a42),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5a2804),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9e5d35),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff263c04),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b7538),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff17100a),
      onSurfaceVariant: Color(0xff41332e),
      outline: Color(0xff5f4f49),
      outlineVariant: Color(0xff7b6963),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382f28),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xffa15a42),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff83432c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9e5d35),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff814520),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b7538),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff445c22),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd3c4ba),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e9),
      surfaceContainer: Color(0xfff5e5db),
      surfaceContainerHigh: Color(0xffe9dad0),
      surfaceContainerHighest: Color(0xffdecfc5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff501c08),
      surfaceTint: Color(0xff8f4c35),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff753822),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4d1f00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff723a15),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1d3200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff385017),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362924),
      outlineVariant: Color(0xff554640),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382f28),
      inversePrimary: Color(0xffffb59c),
      primaryFixed: Color(0xff753822),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff58220e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff723a15),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff562402),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff385017),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff233902),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4b6ad),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffeeee4),
      surfaceContainer: Color(0xffefe0d6),
      surfaceContainerHigh: Color(0xffe1d2c8),
      surfaceContainerHighest: Color(0xffd3c4ba),
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
      onPrimary: Color(0xff55200c),
      primaryContainer: Color(0xff723520),
      onPrimaryContainer: Color(0xffffdbcf),
      secondary: Color(0xffffb68e),
      onSecondary: Color(0xff532200),
      secondaryContainer: Color(0xff6f3813),
      onSecondaryContainer: Color(0xffffdbc9),
      tertiary: Color(0xffb3d089),
      onTertiary: Color(0xff203600),
      tertiaryContainer: Color(0xff364e15),
      onTertiaryContainer: Color(0xffceeda2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff19120c),
      onSurface: Color(0xffefe0d6),
      onSurfaceVariant: Color(0xffd8c2bb),
      outline: Color(0xffa08d86),
      outlineVariant: Color(0xff53433e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d6),
      inversePrimary: Color(0xff8f4c35),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff390c00),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff723520),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff331200),
      secondaryFixedDim: Color(0xffffb68e),
      onSecondaryFixedVariant: Color(0xff6f3813),
      tertiaryFixed: Color(0xffceeda2),
      onTertiaryFixed: Color(0xff112000),
      tertiaryFixedDim: Color(0xffb3d089),
      onTertiaryFixedVariant: Color(0xff364e15),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff413731),
      surfaceContainerLowest: Color(0xff140d08),
      surfaceContainerLow: Color(0xff221a14),
      surfaceContainer: Color(0xff261e18),
      surfaceContainerHigh: Color(0xff312822),
      surfaceContainerHighest: Color(0xff3c332c),
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
      onPrimary: Color(0xff471503),
      primaryContainer: Color(0xffcb7d62),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd3bd),
      onSecondary: Color(0xff431a00),
      secondaryContainer: Color(0xffc87f55),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc8e79d),
      onTertiary: Color(0xff182b00),
      tertiaryContainer: Color(0xff7e9a58),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff19120c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed8d0),
      outline: Color(0xffc2aea7),
      outlineVariant: Color(0xffa08c86),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d6),
      inversePrimary: Color(0xff733621),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff270600),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff5d2511),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff230a00),
      secondaryFixedDim: Color(0xffffb68e),
      onSecondaryFixedVariant: Color(0xff5a2804),
      tertiaryFixed: Color(0xffceeda2),
      onTertiaryFixed: Color(0xff091400),
      tertiaryFixedDim: Color(0xffb3d089),
      onTertiaryFixedVariant: Color(0xff263c04),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff4c433c),
      surfaceContainerLowest: Color(0xff0c0603),
      surfaceContainerLow: Color(0xff241c16),
      surfaceContainer: Color(0xff2f2620),
      surfaceContainerHigh: Color(0xff3a312a),
      surfaceContainerHighest: Color(0xff453c35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece6),
      surfaceTint: Color(0xffffb59c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaf95),
      onPrimaryContainer: Color(0xff1d0400),
      secondary: Color(0xffffece4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb185),
      onSecondaryContainer: Color(0xff190600),
      tertiary: Color(0xffdcfbaf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffafcd85),
      onTertiaryContainer: Color(0xff050e00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff19120c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece6),
      outlineVariant: Color(0xffd4beb7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefe0d6),
      inversePrimary: Color(0xff733621),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb59c),
      onPrimaryFixedVariant: Color(0xff270600),
      secondaryFixed: Color(0xffffdbc9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb68e),
      onSecondaryFixedVariant: Color(0xff230a00),
      tertiaryFixed: Color(0xffceeda2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb3d089),
      onTertiaryFixedVariant: Color(0xff091400),
      surfaceDim: Color(0xff19120c),
      surfaceBright: Color(0xff584e47),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff261e18),
      surfaceContainer: Color(0xff382f28),
      surfaceContainerHigh: Color(0xff433a33),
      surfaceContainerHighest: Color(0xff4f453e),
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
