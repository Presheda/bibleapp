import 'package:bibleapp/dashboard/widget/export_widgets.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [CustomText(title: "Help Me")],
      ),
      bottomNavigationBar: BibleBottomNavBar(
          index: index,
          onTap: (index) {
            print("Nothing much happened $index");

            setState(() {
              this.index = index;
            });
          }),
    );
  }
}
