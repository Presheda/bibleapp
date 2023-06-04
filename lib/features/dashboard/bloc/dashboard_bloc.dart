import 'dart:async';

import 'package:bibleapp/features/dashboard/bloc/dashboard_event.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardStateCurrentIndexChanged(currentIndex: 0)) {
    on<DashboardEventIndexChanged>(_dashboardIndexChanged);
  }

  void _dashboardIndexChanged(
      DashboardEventIndexChanged event, Emitter<DashBoardState> emit) {
    emit(DashBoardStateCurrentIndexChanged(currentIndex: event.currentIndex));
  }
}
