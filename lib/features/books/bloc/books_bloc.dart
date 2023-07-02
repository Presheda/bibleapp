import 'dart:async';
import 'package:bibleapp/features/books/model/verse.dart';
import 'package:bibleapp/features/books/model/verse_search_response.dart';
import 'package:rxdart/rxdart.dart';
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
    on<BooksEventsBookLoading>(
      _booksLoadingInitiated,
    );
    on<BooksEventsBookSearching>(_booksSearchingInitiated,
        transformer: debounce(const Duration(milliseconds: 200)));
    on<BooksEventsBookSearchingVerseToggled>(_booksSearchingVerseToggled);

    startLoading();
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  FutureOr<void> _booksLoadingInitiated(
      BooksEventsBookLoading event, Emitter<BibleBlocState> emit) async {
    List<BookData> books;
    try {
      books = await booksRepository.fetchAllBooks();

      debugPrint("Book loaad is called");

      emit(state.copyWith(
          oldTestament: [],
          newTestament: [],
          loadStatus: BibleStateLoadStatus.loadSuccess,
          booksList: books,
          bibleState: BibleState.bookLoad));
    } catch (e) {
      debugPrint("returned result is ${e}");

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
      BooksEventsBookSearching event, Emitter<BibleBlocState> emit) async {
    if (event.text.trim().isEmpty) {
      debugPrint("hey it's empty");
      return;
    }

    try {
      VerseSearchResponse searchResult = await booksRepository.searchVerse(
        query: event.text.trim(),
      );

      emit(state.copyWith(
          bibleState: BibleState.search,
          loadStatus: BibleStateLoadStatus.loadSuccess,
          verseSearchResult: searchResult.data.verses));
    } catch (_) {
      emit(state.copyWith(
        bibleState: BibleState.search,
        loadStatus: BibleStateLoadStatus.loadFailed,
      ));
    }

    debugPrint("Search is called, ${event.text}");
  }

  FutureOr<void> _booksSearchingVerseToggled(
      BooksEventsBookSearchingVerseToggled event,
      Emitter<BibleBlocState> emit) {
    debugPrint("Verse ${event.verse} and chapter ${event.chapter}");
    emit(state.copyWith(verse: event.verse, chapter: event.chapter, bibleState: BibleState.search));
  }


}
