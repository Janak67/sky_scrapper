import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white12,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Colors.black),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Colors.white),
);
