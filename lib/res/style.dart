import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class Styles {
  static final primaryTheme = ThemeData.light().copyWith(
    primaryColor: Colorz.primary,
    scaffoldBackgroundColor: Colorz.background,
    appBarTheme: primaryAppbarTheme,
    elevatedButtonTheme: primaryElevatedButtonTheme,
    bottomNavigationBarTheme: primaryBottomNavigationBarTheme,
    textTheme: primaryTextTheme
  );

  static final primaryElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: Colorz.primary, textStyle: const TextStyle(color: Colors.white)),
  );

  static const primaryAppbarTheme = AppBarTheme(
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

  static const textStyle = TextStyle(color: Colors.white);

  static const primaryTextTheme = TextTheme(
    headline1: textStyle,
    headline2: textStyle,
    headline3: textStyle,
    headline4: textStyle,
    headline5: textStyle,
    headline6: textStyle,
    subtitle1: textStyle,
    subtitle2: textStyle,
    bodyText1: textStyle,
    bodyText2: textStyle,
    caption: textStyle,
    button: textStyle,
    overline: textStyle,
  );

  static const primaryBottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedItemColor: Colorz.primary,
    unselectedItemColor: Colors.black54,
    selectedLabelStyle: TextStyle(fontSize: 12, color: Colorz.primary),
    unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.black54),
    type: BottomNavigationBarType.fixed,
  );
}