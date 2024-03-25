import 'package:Ayat/Home/Compass/compass.dart';
import 'package:Ayat/Home/Hadeth/hadeth_details_screen.dart';
import 'package:Ayat/Home/PrayTimes/pray_time.dart';
import 'package:Ayat/Home/Quran/QuranNewTap/constant.dart';
import 'package:Ayat/Home/Quran/QuranNewTap/quran_screen.dart';
import 'package:Ayat/Home/Quran/QuranNewTap/settings.dart';
import 'package:Ayat/Home/home_screen.dart';
import 'package:Ayat/Home/widgets/sura_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'Home/Providers/settings_provider.dart';
import 'Splash/splash_screen.dart';
import 'Styles/theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // arabic
        ],
        locale: Locale(settingsProvider.currentLanguage),
        themeMode: settingsProvider.currentTheme,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          Settings.routeName: (context) => const Settings(),
          QuranScreen.routeName: (context) => const QuranScreen(),
          PrayTimes.routeName: (context) => const PrayTimes(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          // SuraContent.routeName: (context) => const SuraContent(),
          HadethDetailsScreen.routeName: (context) =>
              const HadethDetailsScreen(),
          Compass.routeName: (context) => const Compass(),
        },
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
