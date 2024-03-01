import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimaryColor = const Color(0xFFB7935F);
  static Color darkPrimaryColor = const Color(0xFF141A2E);
  static bool isDarkSelected = true;
  static ThemeData lightTheme = ThemeData(
      // fontFamily: 'cairo',
      dividerColor: lightPrimaryColor,
      primaryColor: lightPrimaryColor,
      // cardColor: lightPrimaryColor,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'ElMessiri',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          titleMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black),
          bodyMedium: TextStyle(
              fontFamily: 'DecoType',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white),
      // scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)));
  static ThemeData darkTheme = ThemeData(
      // fontFamily: 'cairo',
      dividerColor: const Color.fromARGB(255, 224, 186, 32),
      primaryColor: darkPrimaryColor,
      cardColor: darkPrimaryColor,
      textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'ElMessiri',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          titleMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.white),
          bodyMedium: TextStyle(
              fontFamily: 'DecoType',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 224, 207, 52))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(size: 40),
          selectedItemColor: Color.fromARGB(255, 218, 202, 60),
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
