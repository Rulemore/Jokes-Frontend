import 'package:flutter/material.dart';
import 'package:zlp_jokes/features/account/account_screen.dart';
import 'package:zlp_jokes/features/main_screen/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;

final List<Widget> screens = [
  const MainScreen(),
  const AccountScreen(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Анекдоты',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
        ),
      ),
      body: MainScreen(),
    );
  }
}
