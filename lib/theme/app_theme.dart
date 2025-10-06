// =================================
// FILE: lib/theme/app_theme.dart
// =================================
import 'package:flutter/material.dart';


class AppTheme {
  static const seed = Color(0xFF2563EB);


  static ThemeData _base(Brightness b) {
    final cs = ColorScheme.fromSeed(seedColor: seed, brightness: b);
    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      cardTheme: CardTheme(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      appBarTheme: const AppBarTheme(centerTitle: false),
      visualDensity: VisualDensity.comfortable,
    );
  }


  static ThemeData get light => _base(Brightness.light);
  static ThemeData get dark => _base(Brightness.dark);
}