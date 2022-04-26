import 'package:flutter/material.dart';
import 'package:stadium_app/core/utils/constants.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/page/login_page.dart';

class CusRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const LogInPage(),
        );
      case SIGNUP_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case SEARCH_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case BOOKING_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case SETTING_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case CHANGE_PASSWORD_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LogInPage(),
        );
    }
  }
}
