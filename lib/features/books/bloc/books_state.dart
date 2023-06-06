
import 'package:bibleapp/features/books/bloc/books_event.dart';
import 'package:bibleapp/features/books/model/bible_books.dart';
import 'package:equatable/equatable.dart';

class BooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BooksStateLoad extends BooksState {
  final List<BibleBooks> booksList = [];
  final BooksEventsStatus eventsStatus;

  BooksStateLoad_() {}

  BooksStateLoad.Loading(
      {this.eventsStatus = BooksEventsStatus.loadingStarted,
      booksList = const []});

  BooksStateLoad.loadingFinished(
      {this.eventsStatus = BooksEventsStatus.loadingFinished,
      required booksList});

  BooksStateLoad.loadingFailed(
      {this.eventsStatus = BooksEventsStatus.loadingFailed,
      booksList = const []});

  @override
  List<Object?> get props => [booksList, eventsStatus];
}


enum BooksSearchStatus { searchStarted,  searchFinished,  searchFailed }

class BooksStateSearching extends BooksState {
  final List<BibleBooks> booksList = [];
  final BooksSearchStatus searchStatus;

  BooksStateSearching_() {}

  BooksStateSearching.Searching(
      {this.searchStatus = BooksSearchStatus.searchStarted,
      booksList = const []});

  BooksStateSearching.searchingFinished(
      {this.searchStatus = BooksSearchStatus.searchFinished,
      required booksList});

  BooksStateSearching.searchingFailed(
      {this.searchStatus = BooksSearchStatus.searchFailed,
      booksList = const []});

  @override
  List<Object?> get props => [booksList, searchStatus];
}
