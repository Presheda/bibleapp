import 'package:bibleapp/books/bloc/books_event.dart';
import 'package:bibleapp/books/bloc/books_state.dart';
import 'package:bloc/bloc.dart';

class BibleBooksBloc extends Bloc<BooksEvents, BooksState>{
  BibleBooksBloc() : super(BooksStateLoadStatus.Loading()) {
    on<BooksEventsLoading> booksLoadinInitiated;
  };

}