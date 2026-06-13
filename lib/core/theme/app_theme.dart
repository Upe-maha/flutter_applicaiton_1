import 'package:flutter/material.dart';

class AppThemeColors {
  const AppThemeColors(this.brightness);

  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;

  Color get background =>
      isDark ? const Color(0xFF0E1117) : const Color(0xFFF7F7FB);
  Color get surface => isDark ? const Color(0xFF151A22) : Colors.white;
  Color get primary =>
      isDark ? const Color(0xFF8AB4FF) : const Color(0xFF1E2A5A);
  Color get onPrimary => isDark ? const Color(0xFF081225) : Colors.white;
  Color get onSurface =>
      isDark ? const Color(0xFFF3F6FB) : const Color(0xFF111827);
  Color get onSurfaceVariant =>
      isDark ? const Color(0xFFB3BDCC) : const Color(0xFF5B6475);
  Color get outline =>
      isDark ? const Color(0xFF364152) : const Color(0xFFD7DCE5);
  Color get outlineVariant =>
      isDark ? const Color(0xFF283140) : const Color(0xFFE4E8F0);
  Color get primaryContainer =>
      isDark ? const Color(0xFF22314F) : const Color(0xFFDCE5FF);
  Color get surfaceContainer =>
      isDark ? const Color(0xFF10151D) : const Color(0xFFF7F7FB);
  Color get surfaceContainerLow => surface;
  Color get surfaceContainerLowest => surface;
  Color get surfaceContainerHigh =>
      isDark ? const Color(0xFF1B212C) : const Color(0xFFF0F2F8);
  Color get surfaceContainerHighest =>
      isDark ? const Color(0xFF222A37) : const Color(0xFFE8ECF5);
  Color get surfaceBright => surface;
  Color get surfaceDim => background;
  Color get inverseSurface => primary;
  Color get onInverseSurface => onPrimary;
  Color get inversePrimary => surface;
}

class AppTheme {
  static ThemeData get lightTheme => _buildTheme(Brightness.light);

  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final colors = AppThemeColors(brightness);

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.primary,
      onSecondary: colors.onPrimary,
      error: brightness == Brightness.dark
          ? Colors.red.shade300
          : Colors.red.shade700,
      onError: brightness == Brightness.dark ? Colors.black : Colors.white,
      surface: colors.surface,
      onSurface: colors.onSurface,
      onSurfaceVariant: colors.onSurfaceVariant,
      outline: colors.outline,
      outlineVariant: colors.outlineVariant,
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: colors.inverseSurface,
      onInverseSurface: colors.onInverseSurface,
      inversePrimary: colors.inversePrimary,
      primaryContainer: colors.primaryContainer,
      onPrimaryContainer: colors.onSurface,
      secondaryContainer: colors.primaryContainer,
      onSecondaryContainer: colors.onSurface,
      tertiary: colors.primary,
      onTertiary: colors.onPrimary,
      tertiaryContainer: colors.primaryContainer,
      onTertiaryContainer: colors.onSurface,
      surfaceTint: colors.primary,
      surfaceDim: colors.surfaceDim,
      surfaceBright: colors.surfaceBright,
      surfaceContainerLowest: colors.surfaceContainerLowest,
      surfaceContainerLow: colors.surfaceContainerLow,
      surfaceContainer: colors.surfaceContainer,
      surfaceContainerHigh: colors.surfaceContainerHigh,
      surfaceContainerHighest: colors.surfaceContainerHighest,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.outlineVariant),
        ),
      ),
    );
  }
}
