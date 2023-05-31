import 'dart:math';

import 'package:bibleapp/app/constants/export_app_constants.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        GeneralAppBar(
          title: CustomText(
            title: "Books",
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
            CustomTextField(
              controller: TextEditingController(),
            ),
            const AppSpacing(
              height: 30,
            ),
            CustomText(
              title: "New Testament",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const AppSpacing(
              height: 10,
            ),

          ]))),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((c, index) {
                return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: multiColors[Random().nextInt(6)]),
                );
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 70,
                  crossAxisSpacing: 10)),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
              delegate: SliverChildListDelegate(([
            const AppSpacing(
              height: 30,
            ),
            CustomText(
              title: "Old Testament",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const AppSpacing(
              height: 10,
            ),
          ]))),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((c, index) {
                return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: multiColors[Random().nextInt(6)]),
                );
              }, childCount: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 70,
                  crossAxisSpacing: 10)),
        ),

      ],
    );
  }
}
