import 'package:bibleapp/app/app_export.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// --TODO will update this screen such that it will have a delay and a bible icon

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.of(context).popAndPushNamed(AppRouteNames.dashboard));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomText(
              title: "Bible App",
              textAlign: TextAlign.center,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
