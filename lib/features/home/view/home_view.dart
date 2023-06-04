import 'dart:math';

import 'package:bibleapp/app/constants/export_app_constants.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GeneralAppBar(
          title: CustomText(
            title: "Home",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
              delegate: SliverChildListDelegate(([
            const AppSpacing(
              height: 30,
            ),
            CustomText(
              title: "Daily verse",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const AppSpacing(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color:multiColors[Random().nextInt(6)]),
            ),
          ]))),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
              delegate: SliverChildListDelegate(([
            const AppSpacing(
              height: 30,
            ),
            CustomText(
              title: "Some other content",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const AppSpacing(
              height: 10,
            ),
          ]))),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 130,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemBuilder: (c, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(

                    height: 130,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: multiColors[Random().nextInt(6)]),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}
