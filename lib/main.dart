import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/widgets/base.dart';
import 'package:shein_ui_clone/features/home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
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
        ),
        home: const SheinAppBase(
          currentIndex: 0,
        ));
  }
}
