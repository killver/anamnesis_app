import 'package:flutter/material.dart';

final ThemeData anamnesisTheme = ThemeData(
  brightness: Brightness.dark, // Tema oscuro
  scaffoldBackgroundColor: const Color(0xFF000000),
  primaryColor: const Color(0xFF000000),
  fontFamily: 'Futura',
  textTheme: const TextTheme(
      // Main titles (e.g., screen headers)
      displayLarge: TextStyle(
        fontFamily: 'Futura',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFFC0C5E0),
      ),
      // Subtitles (e.g., section titles)
      headlineMedium: TextStyle(
        fontFamily: 'Futura',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 1.5,
      ),
      // Body text (e.g., explanations, paragraphs)
      bodyMedium: TextStyle(
        fontFamily: 'Futura',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      // Field labels or questions
      titleMedium: TextStyle(
        fontFamily: 'Futura',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      // Placeholder text in text fields
      bodySmall: TextStyle(
          fontFamily: 'Futura',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontStyle: FontStyle.italic),
      // Disabled button text style
      labelLarge: TextStyle(
        fontFamily: 'Futura',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      // Small text for labels
      labelSmall: TextStyle(
        fontFamily: 'Futura',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      )),
  // Input field decoration theme (hint text and borders)
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontFamily: 'Futura',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFFA9A9A9),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB0B0B0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFB0B0B0)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontFamily: 'Futura',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(
              0xFF161621); // Light gray text color for disabled buttons
        }
        return const Color(0xFF161621); // Normal button text color
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(
              0xFF585853); // Light gray background for disabled buttons
        }
        return const Color(
            0xFFEDC603); // Yellow background color for active buttons
      }),
      minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
  ),
);
