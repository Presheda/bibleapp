import 'package:equatable/equatable.dart';
class DashBoardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashBoardStateCurrentIndexChanged extends DashBoardState {
  final int currentIndex;
  DashBoardStateCurrentIndexChanged({this.currentIndex = 0});

  @override
  List<Object?> get props => [currentIndex];

  DashBoardStateCurrentIndexChanged copyWith({
    int? currentIndex,
  }) {
    return DashBoardStateCurrentIndexChanged(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
