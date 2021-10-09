import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MagazineCoverImage extends StatefulWidget {
  const MagazineCoverImage({Key? key, required this.scrollPer})
      : super(key: key);

  final double scrollPer;

  @override
  State<MagazineCoverImage> createState() => _MagazineCoverImageState();
}

class _MagazineCoverImageState extends State<MagazineCoverImage> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final opacityRate = widget.scrollPer > 0.9 ? 1 : 0.45;
    return Transform(
      transform: Matrix4.identity(),
      child: Opacity(
        opacity: math.max((1 - widget.scrollPer * opacityRate), 0),
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
            child: const MagazinePageView(),
          ),
        ),
      ),
    );
  }
}

class MagazinePageView extends StatefulWidget {
  const MagazinePageView({
    Key? key,
  }) : super(key: key);

  @override
  State<MagazinePageView> createState() => _MagazinePageViewState();
}

class _MagazinePageViewState extends State<MagazinePageView> {
  late final PageController _controller;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _controller.addListener(() {
      pageOffset = _controller.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: PageView.builder(
          controller: _controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            final offset = (pageOffset - index).abs();
            final rotationValue = offset * pi;
            final rotationAngle =
                offset > 0.5 ? pi - rotationValue : rotationValue;
            return Transform(
              transform: Matrix4.rotationY(rotationAngle),
              child: Image.asset(
                "assets/images/music-album.jpg",
                width: 200,
                height: 250,
              ),
            );
          }),
    );
  }
}
