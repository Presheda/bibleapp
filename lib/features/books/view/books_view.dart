import 'dart:math';

import 'package:bibleapp/app/constants/export_app_constants.dart';
import 'package:bibleapp/features/books/bloc/bible_book_state.dart';
import 'package:bibleapp/features/books/widget/bible_book_widget.dart';

import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bibleapp/features/books/bloc/books_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BooksView being built/rebuilt");

    return BlocBuilder<BibleBooksBloc, BibleBlocState>(
        builder: (context, state) {
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
          BlocBuilder<BibleBooksBloc, BibleBlocState>(
              buildWhen: (state, current) =>
                  current.bibleState == BibleState.bookLoad,
              builder: (context, state) {
                if (state.loadStatus == BibleStateLoadStatus.loadSuccess) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((c, index) {
                          return BibleBookWidget(
                              books: state.newTestament[index]);
                        }, childCount: state.newTestament.length),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 70,
                                crossAxisSpacing: 10)),
                  );
                }

                if (state.loadStatus == BibleStateLoadStatus.loadFailed) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(([
                        const AppSpacing(
                          height: 10,
                        ),
                        CustomText(
                          title: "Load Failed",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                      ])),
                    ),
                  );
                }

                /// we just want to return loading progress
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(([
                      const AppSpacing(
                        height: 10,
                      ),
                      const SizedBox(
                          height: 50,
                          width: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator()))
                    ])),
                  ),
                );
              }),
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
          BlocBuilder<BibleBooksBloc, BibleBlocState>(
              buildWhen: (state, current) =>
                  current.bibleState == BibleState.bookLoad,
              builder: (context, state) {
                if (state.loadStatus == BibleStateLoadStatus.loadSuccess) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate((c, index) {
                          return BibleBookWidget(
                              books: state.oldTestament[index]);
                        }, childCount: state.oldTestament.length),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 70,
                                crossAxisSpacing: 10)),
                  );
                }
                if (state.loadStatus == BibleStateLoadStatus.loadFailed) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(([
                        const AppSpacing(
                          height: 10,
                        ),
                        CustomText(
                          title: "Load Failed",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                      ])),
                    ),
                  );
                }

                /// we just want to return loading progress
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(([
                      const AppSpacing(
                        height: 10,
                      ),
                      const SizedBox(
                          height: 50,
                          width: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator()))
                    ])),
                  ),
                );
              }),
        ],
      );
    });
  }
}
