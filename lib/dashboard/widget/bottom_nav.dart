import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BibleBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int index) onTap;

  const BibleBottomNavBar(
      {super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      height: 100,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      elevation: 20,
      activeIndex: index,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      onTap: onTap,
      itemCount: 5,
      tabBuilder: (int index, bool isActive) {
        late IconData icon;
        late String iconTitle;
        switch (index) {
          case 0:
            icon = Icons.home;
            iconTitle = "Home";
            break;

          case 1:
            icon = Icons.menu_book_outlined;
            iconTitle = "Books";
            break;
          case 2:
            icon = Icons.favorite_rounded;
            iconTitle = "Favorite";
            break;
          case 3:
            icon = Icons.settings;
            iconTitle = "Settings";
            break;
        }

        // if(index == 0){
        //
        //   return Icon(
        //    Icons.home_outlined,
        //     color: isActive != null && isActive
        //         ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
        //         : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        //     size: isActive != null && isActive ? 28 : 24,
        //
        //   );
        // }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive
                  ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
              size: isActive ? 28 : 24,
            ),
            Text(iconTitle)
          ],
        );
      },
      //other params
    );
  }
}
