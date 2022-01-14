import 'package:flutter/material.dart';
import 'package:inventoryapp/controllers/database_controller.dart';
import 'package:inventoryapp/controllers/theme_controller.dart';
import 'package:inventoryapp/database/db_helper.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';

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
    ThemeMode? themeMode = context.watch<ThemeController>().themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        canvasColor: const Color(0xffd4bff9),
        primaryColor: const Color.fromRGBO(81, 164, 90, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff6750a4),
          secondary: const Color(0xff625b71),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff605d62)),
          headline2: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
          headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xff605d62)),
          subtitle1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff605d62)),
          subtitle2: TextStyle(
            fontSize: 16,
            color: Color(0xff7d5260),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      darkTheme: ThemeData(
        canvasColor:const Color(0xff63577e),
        primaryColor: const Color.fromRGBO(81, 164, 90, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff502a32),
          secondary: const Color(0xff6d3b59),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xffd2c3ab)),
          headline2: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
          headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Color(0xffd2c3ab)),
          subtitle1: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xffd2c3ab)),
          subtitle2: TextStyle(
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
