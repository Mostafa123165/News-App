import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20.0,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        caption: TextStyle(color: Colors.black),
      ),
    );

ThemeData darkThem() => ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: HexColor('333739'),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: HexColor('333739'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 20.0,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        caption: TextStyle(color: Colors.white),
        subtitle1: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    border: OutlineInputBorder(),
    hintStyle: TextStyle(
      color: Colors.white,
    )
  )
    );
