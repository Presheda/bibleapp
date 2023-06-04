import 'dart:async';

import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/features/books/bloc/books_state.dart';
import 'package:bibleapp/features/books/model/bible_books.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:bibleapp/features/books/repository/books_repository_interface.dart';
import 'package:bloc/bloc.dart';

class BibleBooksBloc extends Bloc<BooksEvents, BooksState> {
  BooksRepositoryInterface booksRepository;

  BibleBooksBloc({BooksRepositoryInterface? booksRepositoryImpl})
      : booksRepository = booksRepositoryImpl ?? BooksRepositoryImpl(),
        super(BooksStateLoadStatus.Loading()) {
    on<BooksEventsLoading>(_booksLoadingInitiated);
    on<BooksEventsSearching>(_booksSearchingInitiated);
  }

  FutureOr<void> _booksLoadingInitiated(
      BooksEventsLoading event, Emitter<BooksState> emit) async {
    List<BibleBooks> books;
    try {
      books = await booksRepository.fetchAllBooks();

      emit(BooksStateLoadStatus.loadingFinished(booksList: books));
    } catch (e) {
      emit(BooksStateLoadStatus.loadingFailed());
    }
  }

  FutureOr<void> _booksSearchingInitiated(
      BooksEventsSearching event, Emitter<BooksState> emit) {}
}
