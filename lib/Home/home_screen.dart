// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islamic/Home/Hadeth/hadeth_tab.dart';
import 'package:islamic/Home/Quran/quran_tab.dart';
import 'package:islamic/Home/Radio/radio_tab.dart';
import 'package:islamic/Home/Sebha/sebha_tab.dart';
import 'package:islamic/Home/settings/settings_tab.dart';
import 'package:islamic/Styles/theme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexItem = 0;

  List tabs = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                MyThemeData.isDarkSelected
                    ? 'assets/images/dark_bg.png'
                    : 'assets/images/default_bg.png',
              ))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          'Islami',
          style: Theme.of(context).textTheme.titleMedium,
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
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: 'Quran'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const ImageIcon(
                    AssetImage("assets/images/icon_hadeth.png")),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: 'Sebha'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon:
                    const ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: 'Radio'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
