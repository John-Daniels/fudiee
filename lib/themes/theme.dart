import 'package:flutter/material.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData buildTheme(context) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBgColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder.copyWith(
          borderSide: BorderSide(color: primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 20,
        ),
      ),
      textTheme: Theme.of(context).textTheme.merge(
            GoogleFonts.interTextTheme().copyWith(
              headline4: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
              ),
            ),
          ),
    );
  }
}

var defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6),
  borderSide: BorderSide(
    color: primaryColor.withOpacity(0.2),
    width: 0.8,
  ),
);
