import 'dart:async';

import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/features/books/bloc/books_state.dart';
import 'package:bibleapp/features/books/model/bible_books.dart';
import 'package:bibleapp/features/books/repository/books_repository_impl.dart';
import 'package:bibleapp/features/books/repository/books_repository_interface.dart';
import 'package:bibleapp/network/custom_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BibleBooksBloc extends Bloc<BooksEvents, BooksState> {
  BooksRepositoryInterface booksRepository;

  BibleBooksBloc({BooksRepositoryInterface? booksRepositoryImpl})
      : booksRepository = booksRepositoryImpl ?? BooksRepositoryImpl(),
        super(BooksStateLoad.Loading()) {
    startLoading();
    on<BooksEventsLoading>(_booksLoadingInitiated);
    on<BooksEventsSearching>(_booksSearchingInitiated);
  }

  FutureOr<void> _booksLoadingInitiated(
      BooksEventsLoading event, Emitter<BooksState> emit) async {
    List<BibleBooks> books;
    try {
      books = await booksRepository.fetchAllBooks(

      );

      print("${books.toList()} length : ${books.length}");
      emit(BooksStateLoad.loadingFinished(booksList: books));
    } catch (e) {
      emit(BooksStateLoad.loadingFailed());
    }

  }

  void startLoading()async{
    List<BibleBooks> books;

    books = await booksRepository.fetchAllBooks();
    debugPrint("Books returned, lenght is ${books.length}");
    return;
    try {
      books = await booksRepository.fetchAllBooks();

      print("${books.toList()} length : ${books.length}");
     // emit(BooksStateLoad.loadingFinished(booksList: books));
    } catch (e) {
    //  emit(BooksStateLoad.loadingFailed());
      print("Error occurred ${(e as CustomException).toString()}");
    }

  }

  FutureOr<void> _booksSearchingInitiated(
      BooksEventsSearching event, Emitter<BooksState> emit) {}
}
