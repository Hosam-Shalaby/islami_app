// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLanguage = 'ar';

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

  bool isDark() => currentTheme == ThemeMode.dark;
  // bool isEnglish() => currentLanguage == const Locale('en');

  String backgroundImage() {
    return isDark()
        ? 'assets/images/background_dark.png'
        : 'assets/images/default_bg.png';
  }

  

}
