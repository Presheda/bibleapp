
 class BooksEvents {}

 class BooksEventsBookLoading extends BooksEvents{
  BooksEventsBookLoading();
}

 class BooksEventsBookSearching extends BooksEvents{
  String text;
  BooksEventsBookSearching({required this.text});
}

 class BooksEventsBookSearchingVerseToggled extends BooksEvents{
  bool verse;
  bool chapter;
  BooksEventsBookSearchingVerseToggled({required this.verse, required this.chapter});
}
