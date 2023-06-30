import 'package:bibleapp/features/books/model/verse_search_result.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';

class BookSearchResultWidget extends StatelessWidget {

  final VerseSearchResult verseSearchResult;
  const BookSearchResultWidget({
    super.key,
    required this.verseSearchResult,
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
            verseSearchResult.text,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            maxLine: 2,
          ),
          const AppSpacing(
            height: 5,
          ),

          Align(
            alignment: Alignment.bottomRight,

            child: CustomText(title: verseSearchResult.id,
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
