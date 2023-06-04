import 'package:bibleapp/app/app_export.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:bibleapp/features/books/repository/books_repository_interface.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:bibleapp/features/dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteNames {
  static const initialRoute = "/";
  static const dashboard = "/dashboard";
}

class AppRoute {
  DashBoardBloc dashBoardBloc = DashBoardBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteNames.initialRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());


      case AppRouteNames.dashboard:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<DashBoardBloc>(
                  create: (_) => dashBoardBloc,
                  child: DashboardScreen(),
                ));

    }

    return MaterialPageRoute(builder: (_) => Scaffold());
  }

  void close() {
    dashBoardBloc.close();
  }
}
