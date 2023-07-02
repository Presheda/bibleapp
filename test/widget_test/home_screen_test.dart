import 'dart:math';

import 'package:bibleapp/app/app_export.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:bibleapp/features/dashboard/dashboard_export.dart';
import 'package:bibleapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Launching the home screen", (tester) async {
    await tester.pumpWidget(bibleMaterialApp(child: DashboardScreen()));

    expect(find.byType(DashboardScreen), findsOneWidget);

    expect(find.byIcon(Icons.menu_book_outlined), findsOneWidget);
    expect(find.text("Daily verse"), findsOneWidget);

    //// all above working

   // expect(find.byType(TextField), findsNothing);
  await tester.tap(find.byIcon(Icons.menu_book_outlined));


   // expect(find.text("New testament"), findsOneWidget);

    await tester.pump();
   // await tester.pump();
   // await tester.pump();


   // expect(find.text("New testament"), findsOneWidget);
  //  expect(find.byIcon(Icons.menu_book_outlined), findsOneWidget);
  });
}

Widget bibleMaterialApp({required Widget child}) {
  AppRoute appRoute = AppRoute();

  return MaterialApp(
    home: Scaffold(
        body: BlocProvider<DashBoardBloc>(
      create: (context) => DashBoardBloc(),
      child: child,
    )),
    onGenerateRoute: appRoute.onGenerateRoute,
    initialRoute: AppRouteNames.dashboard,
  );
}
