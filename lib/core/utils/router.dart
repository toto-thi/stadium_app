import 'package:flutter/material.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'package:stadium_app/features/firebase_auth/presentation/page/forgot_password_page.dart';
import 'package:stadium_app/features/firebase_auth/presentation/page/sign_up_page.dart';
import 'package:stadium_app/features/firebase_auth/presentation/page/sing_in_page.dart';
import 'package:stadium_app/widget/home_widget/bottom_navigation_bar.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SIGN_IN_ROUTE:
        return materialBuilder(
          widget: const SignInPage(),
        );
      case SIGN_UP_ROUTE:
        return materialBuilder(
          widget: const SignUpPage(),
        );
      case FORGOT_PASSWORD_ROUTE:
        return materialBuilder(
          widget: const ForgotPasswordPage(),
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => const MyBottomNavigationBar(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
