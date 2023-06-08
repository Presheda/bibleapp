//enum BooksEventsStatus { loadingStarted, loadingFinished, loadingFailed }

 class BooksEvents {}

 class BooksEventsBookLoading extends BooksEvents{
 // final BooksEventsStatus eventsStatus;

 // BooksEventsLoading({required this.eventsStatus});
  BooksEventsBookLoading();
}

 class BooksEventsBookSearching extends BooksEvents{
  String text;
  BooksEventsBookSearching({required this.text});
}
