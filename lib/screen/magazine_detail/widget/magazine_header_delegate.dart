import 'package:e_magazine_ui/core/animations/animations.dart';
import 'package:e_magazine_ui/screen/magazine_detail/widget/magazine_cover_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MagazinHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxExented;
  final double minExented;
  final Size deviceSize;
  MagazinHeaderDelegate(
      {required this.maxExented,
      required this.deviceSize,
      required this.minExented});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final scrollPer =
        math.min(shrinkOffset / (maxExented - minExented), 1).toDouble();
    final reverseScrollPre = 1 - scrollPer;

    // print("scroll persent : ${(scrollPer)}");
    print("reverse scroll persent : ${(reverseScrollPre * -50)}");

    return Stack(
      // fit: StackFit.expand,
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
        ),
        // Header  image
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: MagazineCoverImage(
            scrollPer: scrollPer,
          ),
        ),
        // header bottom text // 03
        Positioned(
          // bottom: 0,
          bottom: reverseScrollPre * -40,
          right: 0,
          left: 0,
          // left: ((deviceSize.width - 80) / 2) * scrollPer,
          child: Container(
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: Text(
              "O3",
              style: TextStyle(
                  fontSize: math.max(220 * reverseScrollPre, 40),
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => maxExented;

  @override
  double get minExtent => minExented;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
