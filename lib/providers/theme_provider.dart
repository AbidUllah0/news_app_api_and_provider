import 'package:flutter/material.dart';

import '../services/dart_theme_preference.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreferences darkThemePreferences = ThemePreferences();
  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
