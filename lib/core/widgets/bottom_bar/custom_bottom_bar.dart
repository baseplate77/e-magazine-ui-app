import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int index = 0;

  double iconSize = 34;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: index,
      onTap: (int value) {
        index = value;
        setState(() {});
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          label: "Home",
          activeIcon: Image.asset(
            "assets/images/home-fill.png",
            width: iconSize,
            height: iconSize,
          ),
          icon: Image.asset(
            "assets/images/home-border.png",
            width: iconSize,
            height: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: "shope",
          activeIcon: Image.asset(
            "assets/images/shopping-bag-fill.png",
            width: iconSize,
            height: iconSize,
          ),
          icon: Image.asset(
            "assets/images/shopping-bag-border.png",
            width: iconSize,
            height: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: "Chat",
          activeIcon: Image.asset(
            "assets/images/chat-fill.png",
            width: iconSize,
            height: iconSize,
          ),
          icon: Image.asset(
            "assets/images/chat-border.png",
            width: iconSize,
            height: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: "Account",
          activeIcon: Image.asset(
            "assets/images/user-fill.png",
            width: iconSize,
            height: iconSize,
          ),
          icon: Image.asset(
            "assets/images/user-border.png",
            width: iconSize,
            height: iconSize,
          ),
        ),
      ],
    );
  }
}
