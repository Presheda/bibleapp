import 'dart:async';

import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/features/books/bloc/books_state.dart';
import 'package:bloc/bloc.dart';

class BibleBooksBloc extends Bloc<BooksEvents, BooksState> {
  BibleBooksBloc() : super(BooksStateLoadStatus.Loading()) {
    on<BooksEventsLoading>(_booksLoadingInitiated);
    on<BooksEventsSearching>(_booksSearchingInitiated);
  }

  FutureOr<void> _booksLoadingInitiated(
      BooksEventsLoading event, Emitter<BooksState> emit) {}


  FutureOr<void> _booksSearchingInitiated(BooksEventsSearching event, Emitter<BooksState> emit) {
  }
}
