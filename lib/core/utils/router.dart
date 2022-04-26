import 'package:flutter/material.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'package:stadium_app/main.dart';

class CusRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case CHANGE_PASSWORD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
