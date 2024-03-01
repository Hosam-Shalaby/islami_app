// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Home/settings/language_bottom_sheet.dart';
import 'package:islamic/Home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.theme),
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
                      ? (AppLocalizations.of(context)!.light)
                      : (AppLocalizations.of(context)!.dark))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((AppLocalizations.of(context)!.language)),
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
              child: Center(
                  child: Text(
                      settingsProvider.currentLanguage == const Locale('en')
                          ? (AppLocalizations.of(context)!.english)
                          : (AppLocalizations.of(context)!.arabic))),
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
