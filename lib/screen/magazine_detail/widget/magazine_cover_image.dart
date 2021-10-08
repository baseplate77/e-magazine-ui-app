import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MagazineCoverImage extends StatelessWidget {
  const MagazineCoverImage({Key? key, required this.scrollPer})
      : super(key: key);

  final double scrollPer;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final opacityRate = scrollPer > 0.9 ? 1 : 0.45;
    return Transform(
      transform: Matrix4.identity(),
      child: Opacity(
        opacity: math.max((1 - scrollPer * opacityRate), 0),
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height * 0.7,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/music-album.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Image.asset(
              "assets/images/music-album.jpg",
              width: 200,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
