import 'package:bibleapp/books/bloc/books_event.dart';
import 'package:bibleapp/books/model/bible_books.dart';
import 'package:equatable/equatable.dart';

class BooksState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BooksStateLoadStatus extends BooksState {
  final List<BibleBooks> booksList = [];
  final BooksEventsStatus eventsStatus;

  BooksStateLoadStatus_() {}

  BooksStateLoadStatus.Loading(
      {this.eventsStatus = BooksEventsStatus.loadingStarted,
      booksList = const []});

  BooksStateLoadStatus.loadingFinished(
      {this.eventsStatus = BooksEventsStatus.loadingFinished,
      required booksList});

  BooksStateLoadStatus.loadingFailed(
      {this.eventsStatus = BooksEventsStatus.loadingFailed,
      booksList = const []});
}
