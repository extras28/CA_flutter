// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18));
}
