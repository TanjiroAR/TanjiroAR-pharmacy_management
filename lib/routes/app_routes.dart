import 'package:flutter/material.dart';
import 'package:pharmacy_management/routes/base_routes.dart';

import 'package:pharmacy_management/screens/sales_screen.dart';

import '../screens/auth/sign_in_screen.dart';
import '../screens/home/home_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String adminDashboard = 'adminDashboard';
  static const String pharmacyDashboard = 'pharmacyDashboard';
  static const String homeScreen = 'homeScreen';
  static const String inventoryScreen = 'inventoryScreen';
  static const String salesScreen = 'salesScreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
          page: const SignInScreen(),
        );
      case homeScreen:
        return BaseRoute(page: const HomeScreen());
      case salesScreen:
        return BaseRoute(page: const SalesScreen());
      default:
        return BaseRoute(page: const SignInScreen());
    }
  }
}
