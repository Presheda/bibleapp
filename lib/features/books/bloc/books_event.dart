enum BooksEventsStatus { loadingStarted, loadingFinished, loadingFailed }

sealed class BooksEvents {}

sealed class BooksEventsLoading extends BooksEvents{
  final BooksEventsStatus eventsStatus;

  BooksEventsLoading({required this.eventsStatus});
}

sealed class BooksEventsSearching extends BooksEvents{
  String text;
  BooksEventsSearching({required this.text});
}
