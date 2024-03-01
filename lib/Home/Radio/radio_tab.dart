import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Styles/theme_data.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  String _currentState = 'pause';

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<SettingsProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio_header.png'),
        SizedBox(height: mediaQuery.height / 15.26),
        Text(
          locale.quranRadioStation,
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(height: mediaQuery.height / 15.26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  AssetImage((appProvider.currentLanguage == 'en')
                      ? 'assets/images/previous_icon.png'
                      : 'assets/images/next_icon.png'),
                  color: (MyThemeData.isDarkSelected)
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _currentState = (_currentState == 'pause') ? 'play' : 'pause';
                  setState(() {});
                },
                child: ImageIcon(
                  AssetImage((_currentState == 'pause')
                      ? 'assets/images/play_icon.png'
                      : 'assets/images/pause_icon.png'),
                  color: (appProvider.isDark())
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  AssetImage((appProvider.currentLanguage == 'en')
                      ? 'assets/images/next_icon.png'
                      : 'assets/images/previous_icon.png'),
                  color: (MyThemeData.isDarkSelected)
                      ? theme.colorScheme.onSecondary
                      : theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
