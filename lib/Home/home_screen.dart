// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islamic/Home/Hadeth/hadeth_tab.dart';
import 'package:islamic/Home/Quran/quran_tab.dart';
import 'package:islamic/Home/Radio/radio_tab.dart';
import 'package:islamic/Home/Sebha/sebha_tab.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/default_bg.png',
              ))),
      child: Scaffold(
        appBar: AppBar(title: const Text('Islami')),
        body: tabs[selectedIndexItem],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndexItem,
          onTap: (value) {
            setState(() {
              selectedIndexItem = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color(0xffB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                label: 'Quran'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                label: 'Hadeth'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                label: 'Sebha'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xffB7935F),
                icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                label: 'Radio'),
          ],
        ),
      ),
    );
  }
}
