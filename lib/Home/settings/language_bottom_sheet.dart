import 'package:Ayat/Home/Providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage('en');
            },
            child: settingsProvider.currentLanguage == 'en'
                ? getSelectedItem((AppLocalizations.of(context)!.english))
                : getUnSelectedItem((AppLocalizations.of(context)!.english)),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage('ar');
            },
            child: settingsProvider.currentLanguage == 'ar'
                ? getSelectedItem((AppLocalizations.of(context)!.arabic))
                : getUnSelectedItem((AppLocalizations.of(context)!.arabic)),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.check,
          size: 25,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
