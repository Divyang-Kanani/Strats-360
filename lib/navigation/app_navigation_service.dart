import 'package:flutter/material.dart';
import 'package:strats_360/navigation/app_nav_path_name.dart';
import 'package:strats_360/pages/dashboard_screen/dashboard_screen.dart';
import 'package:strats_360/pages/splash_screen/splash_screen.dart';

class AppNavigationService {
  AppNavigationService._();

  static Route<MaterialPageRoute> generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppNavPathName.splashScreenPath:
        return MaterialPageRoute(
          builder: (_) => SplashScreen.create(),
        );

      case AppNavPathName.dashboardScreenPath:
        return MaterialPageRoute(
          builder: (_) => DashboardScreen.create(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<MaterialPageRoute> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        final theme = Theme.of(context).textTheme;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Text(
              "Invalid linked screen",
              style: theme.displayMedium!.copyWith(
                fontSize: 15,
              ),
            ),
          ),
        );
      },
    );
  }
}
