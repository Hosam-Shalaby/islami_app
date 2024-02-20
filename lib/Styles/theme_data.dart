import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimaryColor = const Color(0xFFB7935F);
  static Color darkPrimaryColor = const Color(0xFF141A2E);
  static bool isDarkSelected = true;
  static ThemeData lightTheme = ThemeData(
      dividerColor: lightPrimaryColor,
      primaryColor: lightPrimaryColor,
      cardColor: lightPrimaryColor,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
          titleMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)));
  static ThemeData darkTheme = ThemeData(
      dividerColor: Colors.amber,
      primaryColor: darkPrimaryColor,
      cardColor: darkPrimaryColor,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          titleMedium: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.yellow)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)));
}