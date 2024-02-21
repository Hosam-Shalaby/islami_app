import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLanguage = const Locale('ar');

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(Locale newLangauge) {
    if (newLangauge == currentLanguage) return;
    currentLanguage = newLangauge;
    notifyListeners();
  }
}
