import 'package:flutter/material.dart';

final ThemeData themeApp = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.white),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrangeAccent),
    primaryIconTheme: const IconThemeData(color: Colors.deepOrangeAccent));
