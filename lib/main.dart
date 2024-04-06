import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
        // brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: routes,
    );
  }
}
