enum BooksEventsStatus { loadingStarted, loadingFinished, loadingFailed }

sealed class BooksEvents {}

sealed class BooksEventsLoading {
  final BooksEventsStatus eventsStatus;

  BooksEventsLoading({required this.eventsStatus});
}

sealed class BooksEventsSearching {
  String text;
  BooksEventsSearching({required this.text});
}
