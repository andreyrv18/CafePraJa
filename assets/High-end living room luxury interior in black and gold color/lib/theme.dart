import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8b4c0a),
      surfaceTint: Color(0xff8e4e0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa96324),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff714d2c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8c6542),
      onSecondaryContainer: Color(0xffffede0),
      tertiary: Color(0xff78592e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff2c894),
      onTertiaryContainer: Color(0xff715229),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf9f9),
      onSurface: Color(0xff1b1b1c),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inversePrimary: Color(0xffffb77e),
      primaryFixed: Color(0xffffdcc3),
      onPrimaryFixed: Color(0xff2f1500),
      primaryFixedDim: Color(0xffffb77e),
      onPrimaryFixedVariant: Color(0xff6e3900),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff2e1600),
      secondaryFixedDim: Color(0xffeebd94),
      onSecondaryFixedVariant: Color(0xff613f20),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffe9c08c),
      onTertiaryFixedVariant: Color(0xff5d4119),
      surfaceDim: Color(0xffdcd9da),
      surfaceBright: Color(0xfffcf9f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f3),
      surfaceContainer: Color(0xfff0edee),
      surfaceContainerHigh: Color(0xffeae7e8),
      surfaceContainerHighest: Color(0xffe4e2e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff562b00),
      surfaceTint: Color(0xff8e4e0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa05c1d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4e2f11),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8c6542),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4b310a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff88673b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf9f9),
      onSurface: Color(0xff111112),
      onSurfaceVariant: Color(0xff333737),
      outline: Color(0xff505354),
      outlineVariant: Color(0xff6a6e6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inversePrimary: Color(0xffffb77e),
      primaryFixed: Color(0xffa05c1d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff824502),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8c6542),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff714d2c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff88673b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6d4f26),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c6c6),
      surfaceBright: Color(0xfffcf9f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f3),
      surfaceContainer: Color(0xffeae7e8),
      surfaceContainerHigh: Color(0xffdfdcdd),
      surfaceContainerHighest: Color(0xffd3d1d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff472200),
      surfaceTint: Color(0xff8e4e0d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff723b00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff422508),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff644222),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3f2702),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff60441b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf9f9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d2d),
      outlineVariant: Color(0xff464a4a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303031),
      inversePrimary: Color(0xffffb77e),
      primaryFixed: Color(0xff723b00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff512800),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff644222),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4a2c0e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff60441b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff472d06),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab8b9),
      surfaceBright: Color(0xfffcf9f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f0f0),
      surfaceContainer: Color(0xffe4e2e2),
      surfaceContainerHigh: Color(0xffd6d4d4),
      surfaceContainerHighest: Color(0xffc8c6c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb77e),
      surfaceTint: Color(0xffffb77e),
      onPrimary: Color(0xff4e2600),
      primaryContainer: Color(0xffcb7f3d),
      onPrimaryContainer: Color(0xff351800),
      secondary: Color(0xffeebd94),
      onSecondary: Color(0xff472a0b),
      secondaryContainer: Color(0xff8c6542),
      onSecondaryContainer: Color(0xffffede0),
      tertiary: Color(0xffffe8ce),
      onTertiary: Color(0xff442b05),
      tertiaryContainer: Color(0xfff2c894),
      onTertiaryContainer: Color(0xff715229),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131314),
      onSurface: Color(0xffe4e2e2),
      onSurfaceVariant: Color(0xffc4c7c7),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e2),
      inversePrimary: Color(0xff8e4e0d),
      primaryFixed: Color(0xffffdcc3),
      onPrimaryFixed: Color(0xff2f1500),
      primaryFixedDim: Color(0xffffb77e),
      onPrimaryFixedVariant: Color(0xff6e3900),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff2e1600),
      secondaryFixedDim: Color(0xffeebd94),
      onSecondaryFixedVariant: Color(0xff613f20),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff2a1800),
      tertiaryFixedDim: Color(0xffe9c08c),
      onTertiaryFixedVariant: Color(0xff5d4119),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff39393a),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1b1b1c),
      surfaceContainer: Color(0xff1f1f20),
      surfaceContainerHigh: Color(0xff2a2a2b),
      surfaceContainerHighest: Color(0xff353535),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd4b5),
      surfaceTint: Color(0xffffb77e),
      onPrimary: Color(0xff3e1d00),
      primaryContainer: Color(0xffcb7f3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd4b1),
      onSecondary: Color(0xff3a1f03),
      secondaryContainer: Color(0xffb38862),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffe8ce),
      onTertiary: Color(0xff442b05),
      tertiaryContainer: Color(0xfff2c894),
      onTertiaryContainer: Color(0xff51370f),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadddd),
      outline: Color(0xffafb2b3),
      outlineVariant: Color(0xff8e9191),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e2),
      inversePrimary: Color(0xff703a00),
      primaryFixed: Color(0xffffdcc3),
      onPrimaryFixed: Color(0xff200c00),
      primaryFixedDim: Color(0xffffb77e),
      onPrimaryFixedVariant: Color(0xff562b00),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff1f0d00),
      secondaryFixedDim: Color(0xffeebd94),
      onSecondaryFixedVariant: Color(0xff4e2f11),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff1c0e00),
      tertiaryFixedDim: Color(0xffe9c08c),
      onTertiaryFixedVariant: Color(0xff4b310a),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff454445),
      surfaceContainerLowest: Color(0xff070708),
      surfaceContainerLow: Color(0xff1d1d1e),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333233),
      surfaceContainerHighest: Color(0xff3e3d3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffede1),
      surfaceTint: Color(0xffffb77e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb274),
      onPrimaryContainer: Color(0xff170700),
      secondary: Color(0xffffede0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffeab990),
      onSecondaryContainer: Color(0xff160800),
      tertiary: Color(0xffffeddb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff2c894),
      onTertiaryContainer: Color(0xff281700),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff131314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeef0f1),
      outlineVariant: Color(0xffc0c3c3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e2),
      inversePrimary: Color(0xff703a00),
      primaryFixed: Color(0xffffdcc3),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb77e),
      onPrimaryFixedVariant: Color(0xff200c00),
      secondaryFixed: Color(0xffffdcc0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffeebd94),
      onSecondaryFixedVariant: Color(0xff1f0d00),
      tertiaryFixed: Color(0xffffddb5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe9c08c),
      onTertiaryFixedVariant: Color(0xff1c0e00),
      surfaceDim: Color(0xff131314),
      surfaceBright: Color(0xff505050),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f1f20),
      surfaceContainer: Color(0xff303031),
      surfaceContainerHigh: Color(0xff3c3b3c),
      surfaceContainerHighest: Color(0xff474647),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
