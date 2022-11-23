import 'package:flutter/material.dart';

var mainTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    foregroundColor: Colors.black
  ),
  iconTheme: const IconThemeData(
    color: Colors.black
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 2,
    selectedItemColor: Colors.black,
  )
);

var usernameFeedStyle = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold
);

var usernameAppBarStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold
);