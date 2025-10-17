import 'package:flutter/material.dart';
import 'package:deeplinks/appcolorscheme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColorScheme.background,

    colorScheme: const ColorScheme.light(
      primary: AppColorScheme.primary,
      secondary: AppColorScheme.secondary,
      background: AppColorScheme.background,
      surface: AppColorScheme.surface,
      error: AppColorScheme.error,
      onPrimary: AppColorScheme.textOnPrimary,
      onSecondary: AppColorScheme.textPrimary,
      onBackground: AppColorScheme.textPrimary,
      onSurface: AppColorScheme.textPrimary,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorScheme.primary,
      foregroundColor: AppColorScheme.textOnPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColorScheme.textOnPrimary,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorScheme.surface,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorScheme.border),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorScheme.primary, width: 1.8),
        borderRadius: BorderRadius.circular(12),
      ),
      hintStyle: const TextStyle(color: AppColorScheme.textSecondary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorScheme.primary,
        foregroundColor: AppColorScheme.textOnPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1,
        minimumSize: const Size(double.infinity, 48),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColorScheme.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColorScheme.textSecondary, fontSize: 14),
      titleLarge: TextStyle(
        color: AppColorScheme.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
