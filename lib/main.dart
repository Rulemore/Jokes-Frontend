import 'package:flutter/material.dart';
import 'package:zlp_jokes/utils/app_colors.dart';
import 'package:zlp_jokes/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZLP jokes',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.color900,
        ),
        scaffoldBackgroundColor: Colors.white,
        shadowColor: const Color(0x00000000),
      ),
    );
  }
}
