import 'package:flutter/material.dart';

// ---------- Өнгө ----------
const purple = Color(0xFF5B4BDE);
const yellow = Color(0xFFFFE552);
const lightBlue = Color(0xFFE8EBFF);
const greyBg = Color(0xFFF4F4F8);
const greyText = Color(0xFF7A7A8C);

// Цагаан самбарын дээд булангийн радиус
const sheetRadius = BorderRadius.vertical(top: Radius.circular(28));

// Бүх апп-д нийтлэг загвар. Энд нэг удаа тохируулснаар
// товч, оруулах талбар, цэс бүгд ижил харагдана.
ThemeData buildTheme() {
  OutlineInputBorder pill(Color c, double w) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: w == 0 ? BorderSide.none : BorderSide(color: c, width: w),
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: purple),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightBlue,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.black38),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      border: pill(Colors.transparent, 0),
      focusedBorder: pill(purple, 1.5),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: purple,
      unselectedItemColor: greyText,
      elevation: 12,
    ),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
  );
}
