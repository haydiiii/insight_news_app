import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight_news_app/core/utils/colors.dart';

final ThemeData applightmode = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(color: AppColors.background),
    fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.cardColor)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.cardColor),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ));
// final ThemeData appdarktmode = ThemeData(
//     appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBackground),
//     scaffoldBackgroundColor: AppColors.darkBackground,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     inputDecorationTheme: InputDecorationTheme(
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: const BorderSide(color: AppColors.primaryColor)),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25),
//         borderSide: const BorderSide(color: AppColors.primaryColor),
//       ),
//       errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: const BorderSide(color: Colors.red)),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//     ));