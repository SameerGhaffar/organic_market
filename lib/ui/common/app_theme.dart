import 'package:flutter/material.dart';

class MyAppbartheme {
  static AppBarTheme lightTheme(BuildContext context) => AppBarTheme(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
  static AppBarTheme darkTheme(BuildContext context) => const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      );
}
