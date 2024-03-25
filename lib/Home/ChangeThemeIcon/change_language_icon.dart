import 'package:Ayat/Home/Providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLanguageIcon extends StatelessWidget {
  const ChangeLanguageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 33,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (settingsProvider.isDark())
                ? Colors.grey.shade600
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              settingsProvider.currentLanguage == "ar"
                  ? settingsProvider.changeLanguage("en")
                  : settingsProvider.changeLanguage("ar");
            },
            icon: const Icon(
              Icons.language,
              size: 18,
              // color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
