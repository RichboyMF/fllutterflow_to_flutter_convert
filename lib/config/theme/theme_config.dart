//[flutter project till Milestone 3] config/theme/theme_config.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF4b39ef);
  static const Color secondary = Color(0xFF39d2c0);
  static const Color tertiary = Color(0xFFee8b60);

  // Light Mode Utility Colors
  static const Color lightAlternate = Color(0xFFe0e3e7);
  static const Color lightPrimaryText = Color(0xFF14181b);
  static const Color lightSecondaryText = Color(0xFF57636c);
  static const Color lightPrimaryBackground = Color(0xFFf1f4f8);
  static const Color lightSecondaryBackground = Color(0xFFFFFFFF);

  // Dark Mode Utility Colors
  static const Color darkAlternate = Color(0xFF262d34);
  static const Color darkPrimaryText = Color(0xFFFFFFFF);
  static const Color darkSecondaryText = Color(0xFF95a1ac);
  static const Color darkPrimaryBackground = Color(0xFF1d2428);
  static const Color darkSecondaryBackground = Color(0xFF14181b);

  // Accent Colors
  static const Color accent1 = Color(0xFF4c4b39ef);
  static const Color accent2 = Color(0xFF4d39d2c0);
  static const Color accent3 = Color(0xFF4dee8b60);
  static const Color lightAccent4 = Color(0xFFccffffff);
  static const Color darkAccent4 = Color(0xFFb2262d34);

  // Semantic Colors
  static const Color success = Color(0xFF249689);
  static const Color error = Color(0xFFff5963);
  static const Color warning = Color(0xFFf9cf58);
  static const Color info = Color(0xFFFFFFFF);
}

class AppTextStyles {
  AppTextStyles._();

  // Title Styles
  static TextStyle get titleLarge => GoogleFonts.interTight(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get titleMedium => GoogleFonts.interTight(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get titleSmall => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  // Label Styles
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  // Body Styles
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );

  // Headline Styles
  static TextStyle get headlineLarge => GoogleFonts.interTight(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get headlineMedium => GoogleFonts.interTight(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );

  static TextStyle get headlineSmall => GoogleFonts.interTight(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightPrimaryBackground,

      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.lightPrimaryBackground,
        surface: AppColors.lightSecondaryBackground,
        error: AppColors.error,
        onPrimary: AppColors.lightPrimaryText,
        onSecondary: AppColors.lightSecondaryText,
        onSurface: AppColors.lightPrimaryText,
        onError: AppColors.lightSecondaryText,
      ),

      // Text Theme
      textTheme: TextTheme(
        // Headlines
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(
          color: AppColors.lightPrimaryText,
        ),

        // Titles
        titleLarge: AppTextStyles.titleLarge.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        titleMedium: AppTextStyles.titleMedium.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        titleSmall: AppTextStyles.titleSmall.copyWith(
          color: AppColors.lightPrimaryText,
        ),

        // Labels
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.lightSecondaryText,
        ),
        labelMedium: AppTextStyles.labelMedium.copyWith(
          color: AppColors.lightSecondaryText,
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.lightSecondaryText,
        ),

        // Body
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.lightPrimaryText,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          minimumSize: const Size(double.infinity, 50),
          textStyle: GoogleFonts.interTight(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: AppTextStyles.labelMedium.copyWith(
          color: AppColors.lightPrimaryText,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSecondaryBackground,
        foregroundColor: AppColors.lightPrimaryText,
        elevation: 0,
        titleTextStyle: AppTextStyles.titleLarge.copyWith(
          color: AppColors.lightPrimaryText,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.lightSecondaryBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.lightPrimaryText,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkPrimaryBackground,

      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.darkPrimaryBackground,
        surface: AppColors.darkSecondaryBackground,
        error: AppColors.error,
        onPrimary: AppColors.darkPrimaryText,
        onSecondary: AppColors.darkSecondaryText,
        onSurface: AppColors.darkPrimaryText,
        onError: AppColors.darkSecondaryText,
      ),

      // Text Theme
      textTheme: TextTheme(
        // Headlines
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        headlineSmall: AppTextStyles.headlineSmall.copyWith(
          color: AppColors.darkPrimaryText,
        ),

        // Titles
        titleLarge: AppTextStyles.titleLarge.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        titleMedium: AppTextStyles.titleMedium.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        titleSmall: AppTextStyles.titleSmall.copyWith(
          color: AppColors.darkPrimaryText,
        ),

        // Labels
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.darkSecondaryText,
        ),
        labelMedium: AppTextStyles.labelMedium.copyWith(
          color: AppColors.darkSecondaryText,
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.darkSecondaryText,
        ),

        // Body
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        bodySmall: AppTextStyles.bodySmall.copyWith(
          color: AppColors.darkPrimaryText,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          minimumSize: const Size(double.infinity, 50),
          textStyle: GoogleFonts.interTight(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: AppTextStyles.labelMedium.copyWith(
          color: AppColors.darkPrimaryText,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSecondaryBackground,
        foregroundColor: AppColors.darkPrimaryText,
        elevation: 0,
        titleTextStyle: AppTextStyles.titleLarge.copyWith(
          color: AppColors.darkPrimaryText,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.darkSecondaryBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.darkPrimaryText,
      ),
    );
  }
}
