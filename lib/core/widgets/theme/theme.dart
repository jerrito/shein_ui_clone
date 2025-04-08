import 'package:flutter/material.dart';

class SheinTheme {
  static ThemeData get sheinTheme {
    return ThemeData(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.grey[100],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black.withValues(alpha: 0.5),
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        // unselectedIconTheme: IconThemeData(color: VacanciesColors.baseBlack),
        type: BottomNavigationBarType.fixed,
        // selectedIconTheme: IconThemeData(color: VacanciesColors.primary),
        // selectedItemColor: VacanciesColors.primary,
        // selectedItemColor: Colors.shaqBlack500,
        // unselectedItemColor: Colors.shaqGrey700,
        // backgroundColor: Colors.shaqBackgroundLight,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          // color: Colors.shaqGrey700,
        ),
      ),
    );
  }
}
