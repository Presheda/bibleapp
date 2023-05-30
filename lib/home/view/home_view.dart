import 'package:bibleapp/widgets/widget_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverAppBar(
          title: CustomText(title: "Home",)
        ),

        SliverList(
            delegate: SliverChildListDelegate(([
          CustomText(
            title: "Daily verse",
            fontSize: 18,
          ),



            const  AppSpacing(
                height: 10,
              ),
              CustomText(title: "Home",)

        ])))
      ],
    );
  }
}
