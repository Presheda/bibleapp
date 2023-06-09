import 'package:bibleapp/app/app_export.dart';
import 'package:bibleapp/themes/theme_light.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class BibleApp extends StatefulWidget {
  const BibleApp({Key? key}) : super(key: key);

  @override
  State<BibleApp> createState() => _BibleAppState();
}

class _BibleAppState extends State<BibleApp> {
  late AppRoute appRoute;

  @override
  void initState() {
    super.initState();
    appRoute = AppRoute();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        onGenerateRoute: appRoute.onGenerateRoute,
        initialRoute: AppRouteNames.initialRoute,
        debugShowCheckedModeBanner: false,
        theme: BibleLightTheme.appLightTheme(),
      ),
    );
  }
}
