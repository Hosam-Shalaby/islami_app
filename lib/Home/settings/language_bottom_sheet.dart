import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

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
              settingsProvider.changeLanguage(const Locale('en'));
            },
            child: getSelectedItem('English'),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              settingsProvider.changeLanguage(const Locale('ar'));
            },
            child: getUnSelectedItem('Arabic'),
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
    return Text(
      text,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
