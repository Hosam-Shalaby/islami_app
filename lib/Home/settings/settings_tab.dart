import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Home/settings/language_bottom_sheet.dart';
import 'package:islamic/Home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Theme'),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.black,
                  border: Border.all(color: const Color(0xFFB7935F), width: 2)),
              child: Center(
                  child: Text(settingsProvider.currentTheme == ThemeMode.light
                      ? 'Light'
                      : 'Dark')),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Language'),
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.black,
                  border: Border.all(color: const Color(0xFFB7935F), width: 2)),
              child: const Center(child: Text('English')),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const ThemeBottomSheet());
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => const LanguageBottomSheet());
  }
}
