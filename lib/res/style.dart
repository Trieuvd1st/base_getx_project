import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class Styles {
  static const fontYuGothic = "YuGothic";
  static const fontNotoSans = "Noto Sans JP";

  static final primaryTheme = ThemeData.light().copyWith(
      primaryColor: Colorz.primary,
      scaffoldBackgroundColor: Colorz.background,
      appBarTheme: primaryAppbarTheme,
      elevatedButtonTheme: primaryElevatedButtonTheme,
      bottomNavigationBarTheme: primaryBottomNavigationBarTheme,
      textTheme: primaryTextTheme);

  static final primaryElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: Colorz.primary,
        textStyle: const TextStyle(color: Colors.white)),
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

  static textYuGothic400({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontYuGothic);
  }

  static textYuGothic500({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontYuGothic);
  }

  static textYuGothic700({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontYuGothic);
  }

  static textNotoSans400({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontNotoSans);
  }

  static textNotoSans500({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontNotoSans);
  }

  static textNotoSans700({Color color = Colors.white, double fontSize = 13}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontNotoSans);
  }

}
