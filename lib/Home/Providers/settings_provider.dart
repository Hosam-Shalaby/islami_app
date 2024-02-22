import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLangauge) {
    if (newLangauge == currentLanguage) return;
    currentLanguage = newLangauge;
    notifyListeners();
  }

  String getBackGround() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/default_bg.png'
        : 'assets/images/dark_bg.png';
  }
}
