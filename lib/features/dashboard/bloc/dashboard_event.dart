import 'package:equatable/equatable.dart';

sealed class DashboardEvent {

}

class DashboardEventIndexChanged extends DashboardEvent{
  final int currentIndex;

  DashboardEventIndexChanged({required this.currentIndex});
}