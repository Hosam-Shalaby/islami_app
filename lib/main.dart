import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/Home/Hadeth/hadeth_details_screen.dart';
import 'package:islamic/Home/home_screen.dart';
import 'Home/Quran/sura_content.dart';
import 'Splash/splash_screen.dart';
import 'Styles/theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: const Locale('ar'),
      themeMode: ThemeMode.dark,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        SuraContent.routeName: (context) => const SuraContent(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
