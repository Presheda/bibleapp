
import 'package:bibleapp/features/books/bloc/books_bloc.dart';
import 'package:bibleapp/features/books/view/books_view.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_event.dart';
import 'package:bibleapp/features/dashboard/bloc/dashboard_state.dart';
import 'package:bibleapp/features/dashboard/widget/export_widgets.dart';
import 'package:bibleapp/features/home/view/home_view.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardView(
        currentIndex: index,
      ),
      bottomNavigationBar: BlocBuilder<DashBoardBloc, DashBoardState>(
          buildWhen: (previousState, currentState) =>
              currentState is DashBoardStateCurrentIndexChanged &&
              currentState.currentIndex != index,
          builder: (context, state) {
            print("ButtomBar is being built $index");
            index = (state as DashBoardStateCurrentIndexChanged).currentIndex;
            return BibleBottomNavBar(
                index:
                    (state as DashBoardStateCurrentIndexChanged).currentIndex,
                onTap: (index) {
                  context
                      .read<DashBoardBloc>()
                      .add(DashboardEventIndexChanged(currentIndex: index));
                });
          }),
    );
  }
}

class DashboardView extends StatefulWidget {
  final int currentIndex;

  const DashboardView({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardBloc, DashBoardState>(
        listener: (previousState, currentState) {
          if (currentState is DashBoardStateCurrentIndexChanged &&
              currentState.currentIndex != controller.page!.round()) {
            controller.animateToPage(currentState.currentIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          }
        },
        buildWhen: (previousState, currentState) =>
            currentState is! DashBoardStateCurrentIndexChanged,
        builder: (context, state) {
          return PageView(
            controller: controller,
            onPageChanged: (int index) {
              context
                  .read<DashBoardBloc>()
                  .add(DashboardEventIndexChanged(currentIndex: index));
            },
            children: [
              const HomeView(),
              BlocProvider<BookDataBloc>(
                create: (context) => BookDataBloc(),
                child:  BooksView(),
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.cyan,
              )
            ],
          );
        });
  }
}
