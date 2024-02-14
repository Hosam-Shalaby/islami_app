import 'package:flutter/material.dart';
import 'package:islamic/Home/home_screen.dart';

import 'Home/Quran/sura_content.dart';
import 'Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(cardColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(size: 40),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        SuraContent.routeName: (context) => const SuraContent(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
