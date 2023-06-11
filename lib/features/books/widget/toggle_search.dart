import 'package:bibleapp/features/books/bloc/bible_book_state.dart';
import 'package:bibleapp/features/books/bloc/books_bloc.dart';
import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

/// this class is used in the search build to toggle search result
/// between verses and chapter

class ToggleSearchButton extends StatelessWidget {
  const ToggleSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BibleBooksBloc, BibleBlocState>(

        builder: (context, state) {
          return ToggleButtons(
            isSelected: [state.verse, state.chapter],
            color: Colors.transparent,
            selectedColor: Colors.transparent,
            //fillColor: Colors.transparent,

            constraints: const BoxConstraints(maxHeight: 50, maxWidth: 100),
            borderColor: Theme.of(context).primaryColor.withOpacity(.2),
            selectedBorderColor: Theme.of(context).primaryColor,

            borderWidth: 1,
            borderRadius: BorderRadius.circular(3),

            onPressed: (index) {
              debugPrint("Toggled at $index");

              if (index == 0) {
                context.read<BibleBooksBloc>().add(BooksEventsBookSearchingVerseToggled(
                    verse : true,
                    chapter : false
                ));
              } else {

                context.read<BibleBooksBloc>().add(BooksEventsBookSearchingVerseToggled(
                    verse : false,
                    chapter : true
                ));
              }
            },
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: CustomText(
                  title: "Verses",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: CustomText(
                  title: "Chapters",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              )
            ],
          );
        });
  }
}
