import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:zlp_jokes/core/di/di.dart';
import 'package:zlp_jokes/features/joke_screen/joke_screen.dart';
import 'package:zlp_jokes/utils/app_colors.dart';
import 'package:zlp_jokes/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
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
      onGenerateRoute: (settings) {
        final Uri uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'joke') {
          final id = int.tryParse(uri.pathSegments[1]);
          if (id != null) {
            return MaterialPageRoute(builder: (context) => JokeScreen(jokeId: id), settings: settings);
          }
        }
        return null;
      },
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
