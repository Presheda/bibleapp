import 'package:flutter/widgets.dart';

/// this spacing is used all around the app to add horizontal spacing and vertical spacing to the app

class AppSpacing extends StatelessWidget {
  final double? width;
  final double? height;

  const AppSpacing({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
