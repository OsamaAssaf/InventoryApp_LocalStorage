import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:inventory_app/controllers/database_controller.dart';
import 'package:inventory_app/controllers/theme_controller.dart';
import 'package:inventory_app/database/db_helper.dart';
import './screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await ThemeController().getTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DBController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeMode? themeMode = context.watch<ThemeController>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: false,
        canvasColor: const Color(0xffd4bff9),
        primaryColor: const Color.fromRGBO(81, 164, 90, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff6750a4),
          secondary: const Color(0xff625b71),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff605d62),
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xff605d62),
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff605d62),
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            color: Color(0xff7d5260),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        canvasColor: const Color(0xff63577e),
        primaryColor: const Color.fromRGBO(81, 164, 90, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff502a32),
          secondary: const Color(0xff6d3b59),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffd2c3ab),
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xffd2c3ab),
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffd2c3ab),
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            color: Color(0xfff5e5cd),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
