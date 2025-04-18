import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shein_ui_clone/core/widgets/base.dart';
import 'package:shein_ui_clone/core/widgets/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: SheinTheme.sheinTheme,
        home: const SheinAppBase(
          currentIndex: 0,
        ));
  }
}
