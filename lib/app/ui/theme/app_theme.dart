import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
    primaryColor: Colors.deepOrange,
    buttonColor: Colors.black,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.deepOrangeAccent,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
        .copyWith(secondary: Colors.black));
