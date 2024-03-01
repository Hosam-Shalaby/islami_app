import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-view';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<SettingsProvider>(context);

    return (appProvider.isDark())
        ? Image.asset(
            'assets/images/splash_screen_dark.png',
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.cover,
          );
  }
}
