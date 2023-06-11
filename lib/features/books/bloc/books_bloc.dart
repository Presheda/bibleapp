import 'dart:async';

import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/features/books/model/book_data.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:bibleapp/features/books/repository/books_repository_interface.dart';
import 'package:bibleapp/network/custom_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bible_book_state.dart';

class BookDataBloc extends Bloc<BooksEvents, BibleBlocState> {
  BooksRepositoryInterface booksRepository;

  List<BookData> oldTestament = [];

  List<BookData> newTestament = [];

  BookDataBloc({BooksRepositoryInterface? booksRepositoryImpl})
      : booksRepository = booksRepositoryImpl ?? BooksRepositoryImpl(),
        super(BibleBlocState()) {
    on<BooksEventsBookLoading>(_booksLoadingInitiated);
    on<BooksEventsBookSearching>(_booksSearchingInitiated);
    on<BooksEventsBookSearchingVerseToggled> (_booksSearchingVerseToggled);

    startLoading();
  }

  FutureOr<void> _booksLoadingInitiated(
      BooksEventsBookLoading event, Emitter<BibleBlocState> emit) async {
    List<BookData> books;
    try {
      books = await booksRepository.fetchAllBooks();

      // oldTestament.addAll(books.where((element) => element.testament == "VT"));
      // newTestament.addAll(books.where((element) => element.testament == "NT"));

      emit(state.copyWith(
          oldTestament: [],
          newTestament:[],
          loadStatus: BibleStateLoadStatus.loadSuccess,
          booksList: books,
          bibleState: BibleState.bookLoad));
    } catch (e) {
      emit(state.copyWith(
        bibleState: BibleState.bookLoad,
        loadStatus: BibleStateLoadStatus.loadFailed,
      ));
    }
  }

  void startLoading() async {
    add(BooksEventsBookLoading());
  }

  FutureOr<void> _booksSearchingInitiated(
      BooksEventsBookSearching event, Emitter<BibleBlocState> emit) {}

  FutureOr<void> _booksSearchingVerseToggled(BooksEventsBookSearchingVerseToggled event, Emitter<BibleBlocState> emit) {

    debugPrint("Verse ${event.verse} and chapter ${event.chapter}");
    emit(state.copyWith(
      verse: event.verse,
      chapter: event.chapter
    ));
  }
}
