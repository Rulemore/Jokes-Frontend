import 'package:flutter/material.dart';
import 'package:zlp_jokes/core/di/di.dart';
import 'package:zlp_jokes/utils/app_colors.dart';
import 'package:zlp_jokes/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  confingureDependecies();

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
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Colors.white,
        shadowColor: const Color(0x00000000),
      ),
    );
  }
}
