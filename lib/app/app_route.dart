import 'package:bibleapp/app/app_export.dart';
import 'package:bibleapp/dashboard/dashboard_export.dart';
import 'package:flutter/material.dart';

class AppRouteNames {
  static const initialRoute = "/";
  static const dashboard = "/dashboard";
}

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    late Widget widget;

    switch (routeSettings.name) {
      case AppRouteNames.initialRoute:
        widget = SplashScreen();
        break;

      case AppRouteNames.dashboard:
        widget = DashboardScreen();
        break;
    }

    return MaterialPageRoute(builder: (_) => widget);
  }

  void close() {}
}
