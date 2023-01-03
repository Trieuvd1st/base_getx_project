import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class Styles {
  static final primaryTheme = ThemeData.light().copyWith(
    primaryColor: Colorz.primary,
    scaffoldBackgroundColor: Colorz.primary,
    appBarTheme: primaryAppbarTheme,
    elevatedButtonTheme: primaryElevatedButtonTheme,
    bottomNavigationBarTheme: primaryBottomNavigationBarTheme,
  );

  static final primaryElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: Colorz.primary, textStyle: const TextStyle(color: Colors.white)),
  );

  static final primaryAppbarTheme = const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    color: Colorz.primary,
    iconTheme: IconThemeData(color: Colors.white, size: 24.0),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    titleSpacing: 0,
  );

  static const primaryBottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: Colorz.primary,
    unselectedItemColor: Colors.black54,
    selectedLabelStyle: TextStyle(fontSize: 12, color: Colorz.primary),
    unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.black54),
    type: BottomNavigationBarType.fixed,
  );
}