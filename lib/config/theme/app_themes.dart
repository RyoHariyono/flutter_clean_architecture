import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'SamsungSans',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xff8b8b8b),
    ),
    titleTextStyle: TextStyle(
      color: Color(0xff8b8b8b),
      fontSize: 18,
    ),
  );
}
