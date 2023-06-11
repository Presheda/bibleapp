import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class BookSubWidget extends StatelessWidget {
  const BookSubWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     color: Theme.of(context)
      //         .inputDecorationTheme
      //         .fillColor),
      child: CustomText(
        title: "Verse  1}",
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}