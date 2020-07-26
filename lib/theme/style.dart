import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      // backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      // We apply this to our appBarTheme because most of our appBar have this style
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black54)),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
