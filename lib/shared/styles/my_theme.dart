import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    primaryColor: primary,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF242424),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: white,
      ),
      color: primary,
    ),
  );
  static ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: darkMode,
    cardColor: secondBlack,
    iconTheme: IconThemeData(color: primaryDark),
    backgroundColor: darkMode,
    primaryColor:primaryDark,
    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),

    bottomAppBarColor: Color(0xFF141922) ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDark,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: primaryDark,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: white,
      ),
      iconTheme: IconThemeData(color: white),
      actionsIconTheme: IconThemeData(color: primaryDark),
      color: primaryDark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:primaryDark ,
shape: CircleBorder(
  side: BorderSide(
    color: secondBlack,
  ),
),




    ),
  );
}
