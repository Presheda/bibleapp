import 'package:bibleapp/features/books/model/bible_books.dart';
import 'package:equatable/equatable.dart';

/// currently there are only two states we want to listen to for our bible state
/// [bookLoad] when bookview is loaded and biblebooks are being loaded
/// [search] when the user starts searching for a book;
///
/// this enum helps us to know what state to respond to
enum BibleState {
  search,
  bookLoad,
}

/// loading a bible book and seraching for a bible book involves getting data from the repository
/// and both action will either result to [loadingStarted], [loadSuccess], [loadFailed]
enum BibleStateLoadStatus { loadingStarted, loadSuccess, loadFailed }

class BibleBlocState extends Equatable {
  /// are we searching or loading
  final BibleState bibleState;
  final BibleStateLoadStatus loadStatus;

  /// the booksLoaded, used for search
  final List<BibleBooks> booksList;

  /// used for normal initial load, we already do the filter in the bloc
  final List<BibleBooks> oldTestament;

  /// used for normal initial load, we already do the filter in the bloc
  final List<BibleBooks> newTestament;

  /// when searching, int he auto-complete modal there's a togglebutton to switch from verse to chapter and vise-versa
  final bool verse;
  final bool chapter;

  BibleBlocState(
      {BibleState? bibleState,
      BibleStateLoadStatus? loadStatus,
      List<BibleBooks>? booksList,
      List<BibleBooks>? oldTestament,
      List<BibleBooks>? newTestament,
      this.verse = true,
      this.chapter = false})
      : bibleState = bibleState ?? BibleState.bookLoad,
        loadStatus = loadStatus ?? BibleStateLoadStatus.loadingStarted,
        booksList = booksList ?? [],
        oldTestament = oldTestament ?? [],
        newTestament = newTestament ?? [];

  const BibleBlocState.loadSuccess(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadSuccess;

  const BibleBlocState.loadFailed(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadFailed;

  const BibleBlocState.loadingStarted(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadingStarted;

  BibleBlocState copyWith(
      {BibleState? bibleState,
      BibleStateLoadStatus? loadStatus,
      List<BibleBooks>? booksList,
      List<BibleBooks>? oldTestament,
      List<BibleBooks>? newTestament,
      bool? verse,
      bool? chapter}) {
    return BibleBlocState(
        bibleState: bibleState ?? this.bibleState,
        loadStatus: loadStatus ?? this.loadStatus,
        booksList: booksList ?? this.booksList,
        oldTestament: oldTestament ?? this.oldTestament,
        newTestament: newTestament ?? this.newTestament,
        verse: verse ?? this.verse,
        chapter: chapter ?? this.chapter);
  }

  List<Object?> get props =>
      [bibleState, loadStatus, booksList, oldTestament, newTestament, verse, chapter];
}
