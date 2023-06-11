import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class BookSearchResultWidget extends StatelessWidget {
  const BookSearchResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context)
              .inputDecorationTheme
              .fillColor),
      child: Column(

        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          CustomText(
            title:
            "For God so loved the world that ehe gave his only begotten son that whosoever believe in him shall not perish but have everlasting life",
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLine: 2,
          ),
          const AppSpacing(
            height: 5,
          ),

          Align(
            alignment: Alignment.bottomRight,

            child: CustomText(title: "Luk 12 : 3",
              //   color: Theme.of(context).colorScheme.secondary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              maxLine: 2,
            ),
          )

        ],
      ),
    );
  }
}
