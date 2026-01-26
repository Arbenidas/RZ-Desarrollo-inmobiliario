import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get sans => GoogleFonts.montserrat();
  static TextStyle get serif => GoogleFonts.playfairDisplay();

  static TextStyle get h1 => serif.copyWith(
        fontSize: 56, // Reduced slightly for mobile safety, responsive scaling needed
        fontWeight: FontWeight.w500,
        height: 1.0,
        letterSpacing: -1.0, 
      );

  static TextStyle get h2 => serif.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w400,
      );

   static TextStyle get h3 => serif.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );

   static TextStyle get h4 => serif.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get bodyLarge => sans.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
      );

  static TextStyle get button => sans.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0, // Tracking 0.2em
      );
  
  static TextStyle get overline => sans.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: AppColors.primary,
  );
}
