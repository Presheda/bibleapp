import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget {

 final  Widget title;

   GeneralAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(

      backgroundColor: Colors.white,

      title: title,
      centerTitle: true,

    );
  }
}
