import 'package:flutter/material.dart';
import 'package:zlp_jokes/features/account/account_screen.dart';
import 'package:zlp_jokes/features/main_screen/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int selectedIndex = 0;
List<NavigationRailDestination> navigationRailDestination = const [
  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Главная')),
  NavigationRailDestination(icon: Icon(Icons.person), label: Text('Личный кабинет')),
];

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
      body: Row(
        children: [
          NavigationRail(
            destinations: navigationRailDestination,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) => setState(() {
              selectedIndex = index;
            }),
            elevation: 10,
            extended: false,
          ),
          screens[selectedIndex],
        ],
      ),
    );
  }
}
