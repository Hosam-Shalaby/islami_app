// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islamic/Home/Azkar/azkar_tab.dart';
import 'package:islamic/Home/ChangeThemeIcon/change_language_icon.dart';
import 'package:islamic/Home/ChangeThemeIcon/change_theme_icon.dart';
import 'package:islamic/Home/Compass/compass.dart';
import 'package:islamic/Home/Hadeth/hadeth_tab.dart';
import 'package:islamic/Home/Quran/quran_tab.dart';
import 'package:islamic/Home/Radio/radio_tab.dart';
import 'package:islamic/Home/Sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Home/settings/settings_tab.dart';
import 'package:provider/provider.dart';

import 'Providers/settings_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexItem = 2;

  List tabs = [
    QuranTab(),
    const HadethTab(),
    const AppScreen(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(settingsProvider.backgroundImage()))),
      child: Scaffold(
        appBar: AppBar(
            actions: const [
              ChangeThemeIcon(),
              ChangeLanguageIcon(),
            ],
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Compass.routeName);
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset('assets/images/compass.png')),
            ),
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        body: tabs[selectedIndexItem],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndexItem,
          onTap: (value) {
            setState(() {
              selectedIndexItem = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(
                    size: 30, AssetImage("assets/images/qq.png")),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(
                    AssetImage("assets/images/icon_hadeth.png")),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: AppLocalizations.of(context)!.azkar),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: AppLocalizations.of(context)!.radio),
            // BottomNavigationBarItem(
            //     backgroundColor: Theme.of(context).primaryColor,
            //     icon: const Icon(Icons.settings),
            //     label: AppLocalizations.of(context)!.settings),
          ],
        ),
      ),
    );
  }
}
