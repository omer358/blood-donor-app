import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287646525),
      surfaceTint: Color(4287646525),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957779),
      onPrimaryContainer: Color(4281993731),
      secondary: Color(4286011216),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957779),
      onSecondaryContainer: Color(4281079057),
      tertiary: Color(4285422638),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294566054),
      onTertiaryContainer: Color(4280556032),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280490264),
      onSurfaceVariant: Color(4283646784),
      outline: Color(4286935919),
      outlineVariant: Color(4292395709),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294948005),
      primaryFixed: Color(4294957779),
      onPrimaryFixed: Color(4281993731),
      primaryFixedDim: Color(4294948005),
      onPrimaryFixedVariant: Color(4285740072),
      secondaryFixed: Color(4294957779),
      onSecondaryFixed: Color(4281079057),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4284301113),
      tertiaryFixed: Color(4294566054),
      onTertiaryFixed: Color(4280556032),
      tertiaryFixedDim: Color(4292658316),
      onTertiaryFixedVariant: Color(4283778329),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765286),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285411364),
      surfaceTint: Color(4287646525),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289355857),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284038198),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589477),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283515157),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287001410),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280490264),
      onSurfaceVariant: Color(4283383612),
      outline: Color(4285291352),
      outlineVariant: Color(4287199091),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294948005),
      primaryFixed: Color(4289355857),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287449403),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589477),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285879374),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287001410),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285291052),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765286),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282585351),
      surfaceTint: Color(4287646525),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285411364),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605143),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284038198),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281082112),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283515157),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281213214),
      outline: Color(4283383612),
      outlineVariant: Color(4283383612),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937452),
      inversePrimary: Color(4294961122),
      primaryFixed: Color(4285411364),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283505425),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284038198),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394145),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283515157),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281936642),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293449427),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294765286),
      surfaceContainerHigh: Color(4294436065),
      surfaceContainerHighest: Color(4294041563),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948005),
      surfaceTint: Color(4294948005),
      onPrimary: Color(4283833876),
      primaryContainer: Color(4285740072),
      onPrimaryContainer: Color(4294957779),
      secondary: Color(4293377461),
      onSecondary: Color(4282657316),
      secondaryContainer: Color(4284301113),
      onSecondaryContainer: Color(4294957779),
      tertiary: Color(4292658316),
      onTertiary: Color(4282199812),
      tertiaryContainer: Color(4283778329),
      onTertiaryContainer: Color(4294566054),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898384),
      onSurface: Color(4294041563),
      onSurfaceVariant: Color(4292395709),
      outline: Color(4288711816),
      outlineVariant: Color(4283646784),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4287646525),
      primaryFixed: Color(4294957779),
      onPrimaryFixed: Color(4281993731),
      primaryFixedDim: Color(4294948005),
      onPrimaryFixedVariant: Color(4285740072),
      secondaryFixed: Color(4294957779),
      onSecondaryFixed: Color(4281079057),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4284301113),
      tertiaryFixed: Color(4294566054),
      onTertiaryFixed: Color(4280556032),
      tertiaryFixedDim: Color(4292658316),
      onTertiaryFixedVariant: Color(4283778329),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949548),
      surfaceTint: Color(4294948005),
      onPrimary: Color(4281533697),
      primaryContainer: Color(4291591019),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293706169),
      onSecondary: Color(4280684556),
      secondaryContainer: Color(4289628288),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292921488),
      onTertiary: Color(4280161536),
      tertiaryContainer: Color(4288974683),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898384),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292658881),
      outline: Color(4289961626),
      outlineVariant: Color(4287790971),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4285805865),
      primaryFixed: Color(4294957779),
      onPrimaryFixed: Color(4281008640),
      primaryFixedDim: Color(4294948005),
      onPrimaryFixedVariant: Color(4284359705),
      secondaryFixed: Color(4294957779),
      onSecondaryFixed: Color(4280290055),
      secondaryFixedDim: Color(4293377461),
      onSecondaryFixedVariant: Color(4283117354),
      tertiaryFixed: Color(4294566054),
      onTertiaryFixed: Color(4279767040),
      tertiaryFixedDim: Color(4292658316),
      onTertiaryFixedVariant: Color(4282594313),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948005),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949548),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293706169),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966006),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292921488),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898384),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292658881),
      outlineVariant: Color(4292658881),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041563),
      inversePrimary: Color(4283308046),
      primaryFixed: Color(4294959322),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949548),
      onPrimaryFixedVariant: Color(4281533697),
      secondaryFixed: Color(4294959322),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293706169),
      onSecondaryFixedVariant: Color(4280684556),
      tertiaryFixed: Color(4294894762),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292921488),
      onTertiaryFixedVariant: Color(4280161536),
      surfaceDim: Color(4279898384),
      surfaceBright: Color(4282529588),
      surfaceContainerLowest: Color(4279503883),
      surfaceContainerLow: Color(4280490264),
      surfaceContainer: Color(4280753435),
      surfaceContainerHigh: Color(4281477158),
      surfaceContainerHighest: Color(4282200624),
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
