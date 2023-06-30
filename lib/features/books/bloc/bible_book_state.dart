import 'package:bibleapp/features/books/model/export_model.dart';
import 'package:bibleapp/features/books/model/verse_search_result.dart';
import 'package:equatable/equatable.dart';

/// currently there are only two states we want to listen to for our bible state
/// [bookLoad] when bookview is loaded and BookData are being loaded
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
  final List<BookData> booksList;

  /// used for normal initial load, we already do the filter in the bloc
  final List<BookData> oldTestament;

  /// used for normal initial load, we already do the filter in the bloc
  final List<BookData> newTestament;

  /// when searching, int he auto-complete modal there's a togglebutton to switch from verse to chapter and vise-versa
  final bool verse;
  final bool chapter;

  final List<VerseSearchResult> verseSearchResult;

  BibleBlocState(
      {BibleState? bibleState,
      BibleStateLoadStatus? loadStatus,
      List<BookData>? booksList,
      List<BookData>? oldTestament,
      List<BookData>? newTestament,
      List<VerseSearchResult>? verseSearchResult,
      this.verse = true,
      this.chapter = false})
      : bibleState = bibleState ?? BibleState.bookLoad,
        loadStatus = loadStatus ?? BibleStateLoadStatus.loadingStarted,
        booksList = booksList ?? [],
        oldTestament = oldTestament ?? [],
        newTestament = newTestament ?? [],
        verseSearchResult = verseSearchResult ?? [];

  const BibleBlocState.loadSuccess(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
        required this.verseSearchResult,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadSuccess;

  const BibleBlocState.loadFailed(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
        required this.verseSearchResult,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadFailed;

  const BibleBlocState.loadingStarted(
      {required this.bibleState,
      required this.booksList,
      required this.oldTestament,
      required this.newTestament,
        required this.verseSearchResult,
      this.verse = true,
      this.chapter = false})
      : loadStatus = BibleStateLoadStatus.loadingStarted;

  BibleBlocState copyWith(
      {BibleState? bibleState,
      BibleStateLoadStatus? loadStatus,
      List<BookData>? booksList,
      List<BookData>? oldTestament,
      List<BookData>? newTestament,
        List<VerseSearchResult>? verseSearchResult,
      bool? verse,
      bool? chapter}) {
    return BibleBlocState(
        bibleState: bibleState ?? this.bibleState,
        loadStatus: loadStatus ?? this.loadStatus,
        booksList: booksList ?? this.booksList,
        oldTestament: oldTestament ?? this.oldTestament,
        newTestament: newTestament ?? this.newTestament,
        verseSearchResult: verseSearchResult ?? this.verseSearchResult,
        verse: verse ?? this.verse,
        chapter: chapter ?? this.chapter);
  }

  List<Object?> get props => [
        bibleState,
        loadStatus,
        booksList,
        oldTestament,
        newTestament,
        verse,
         verseSearchResult
      ];
}
