import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'magazine_cover_image.dart';

class MagazinHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxExented;
  final double minExented;
  final Size deviceSize;
  final String imagePath;
  final String tag;
  MagazinHeaderDelegate(
      {required this.maxExented,
      required this.deviceSize,
      required this.imagePath,
      required this.tag,
      required this.minExented});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final scrollPer =
        math.min(shrinkOffset / (maxExented - minExented), 1).toDouble();

    final reverseScrollPre = 1 - scrollPer;

    // print("scroll persent : ${(scrollPer)}");
    // print("reverse scroll persent : ${(reverseScrollPre * -50)}");

    return Stack(
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
            imagePath: imagePath,
            tag: tag,
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
            // color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: Text(
              "O3",
              style: TextStyle(
                fontSize: math.max(220 * reverseScrollPre, 40),
                height: 1,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Positioned( top: reverseScrollPre * deviceSize.height * 0.6,
        //   right: 20,
        //   child: Container(
        //     padding: const EdgeInsets.all(5),
        //     decoration: BoxDecoration(
        //         color: Colors.grey, borderRadius: BorderRadius.circular(8)),
        //     child: Column(
        //       children: const [
        //         Icon(
        //           Icons.favorite,
        //           color: Colors.white,
        //         ),
        //         Divider(
        //           color: Colors.black26,
        //         ),
        //         Icon(
        //           Icons.bookmark,
        //           color: Colors.white,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
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
