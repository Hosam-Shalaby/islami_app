import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/Home/Compass/compass.dart';
import 'package:islamic/Home/Hadeth/hadeth_details_screen.dart';
import 'package:islamic/Home/PrayTimes/pray_time.dart';
import 'package:islamic/Home/home_screen.dart';
import 'package:provider/provider.dart';
import 'Home/Providers/settings_provider.dart';
import 'Home/Quran/sura_content.dart';
import 'Splash/splash_screen.dart';
import 'Styles/theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
       child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          PrayTimes.routeName: (context) => const PrayTimes(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          SuraContent.routeName: (context) => const SuraContent(),
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
