import 'package:flutter/material.dart';

final lightThemData = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff0DB29E), // Cinnabar - Main
    primaryContainer: Color(0xffFDE8E8), // Light Bone
    onPrimary: Colors.white,
    background: Color(0xFFFFFAFA), // Platinum
    secondary: Color(0xff0DB29E),
    secondaryContainer: Color(0xff0072c7),
    onSecondary: Colors.white,
    surface: Colors.white,
    error: Color(0xffE34949),
    onBackground: Color(0xff282828),
    onSurface: Color(0xff585451), // Black Cow
    onError: Colors.white,
  ),
  fontFamily: 'SourceSans',
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color(0xff585451),
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff585451), // Black Cow
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xff585451), // Black Cow
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
  bottomAppBarTheme:
      const BottomAppBarTheme(elevation: 0, color: Color(0xffFAFAFA)),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    focusColor: const Color(0xff004AD7),
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: const Color(0xff858C94).withOpacity(0.3),
      ),
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      color: const Color(0xff585451).withOpacity(0.5),
      fontWeight: FontWeight.w600,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xff004AD7),
          width: 2,
        )),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    fillColor: Colors.white,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 2,
    shadowColor: const Color(0xff5881A0).withOpacity(0.2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  )),
  scaffoldBackgroundColor: const Color(0xffFAFAFA),
  appBarTheme: const AppBarTheme(
    color: Color(0xffFAFAFA),
    elevation: 0,
    iconTheme: IconThemeData(
      color: Color(0xff585451),
    ),
    actionsIconTheme: IconThemeData(
      color: Color(0xff585451),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffFAFAFA),
      selectedItemColor: Color(0xff0DB29E),
      unselectedItemColor: Color(0xff8B8B8B),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Color(0xff0DB29E),
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        color: Color(0xff8B8B8B),
      )),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff333333)),
        borderRadius: BorderRadius.circular(1)),
    fillColor: MaterialStateProperty.all(const Color(0xff0DB29E)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: const Color(0xff18a0fb),
      textStyle:
          const TextStyle(fontSize: 14, decoration: TextDecoration.underline),
    ),
  ),
);
