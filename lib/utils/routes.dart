import 'package:flutter/material.dart';
import 'package:zlp_jokes/features/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // Routes.startScreen: (context) => const StartScreen(),
  // Routes.authScreen: (context) => const AuthScreen(initialIndex: 1),
  // Routes.confirmEmailScreen: (context) => const ConfirmEmailScreen(),
  // Routes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
  // Routes.confirmResetPasswordScreen: (context) => const ConfirmResetPasswordScreen(),
  // Routes.changePasswordScreen: (context) => const ChangePasswordScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
};

sealed class Routes {
  // static const String startScreen = '/';

  // static const String authScreen = '/start/auth';

  // static const String confirmEmailScreen = '/start/auth/confirm_email';

  // static const String resetPasswordScreen = '/start/auth/reset';

  // static const String confirmResetPasswordScreen = '/start/auth/reset/confirm';

  // static const String changePasswordScreen = '/start/auth/reset/confirm/changed';

  static const String homeScreen = '/';
}
