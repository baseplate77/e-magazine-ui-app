import 'dart:math';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class MagazineCoverImage extends StatefulWidget {
  const MagazineCoverImage(
      {Key? key,
      required this.scrollPer,
      required this.imagePath,
      required this.tag})
      : super(key: key);

  final String imagePath;
  final String tag;
  final double scrollPer;

  @override
  State<MagazineCoverImage> createState() => _MagazineCoverImageState();
}

class _MagazineCoverImageState extends State<MagazineCoverImage> {
  @override
  Widget build(BuildContext context) {
    print("tag : ${widget.tag}");
    final deviceSize = MediaQuery.of(context).size;
    final opacityRate = widget.scrollPer > 0.9 ? 1 : 0.45;

    const _scrollOffset = 0.7;

    final _scaleValue = 2.5 * widget.scrollPer;
    final _transformYValue = -100 * widget.scrollPer;
    const _scaleValue70 = 2.5 * _scrollOffset;
    const _transfromYValue70 = -100 * _scrollOffset;
    final _tranformYReverse =
        // _transfromYValue70 + math.min(0, widget.scrollPer * 90);
        -70 * _transfromYValue70 / _transformYValue;

    final _is70PerScrolled = widget.scrollPer >= _scrollOffset;

    return Opacity(
      opacity: math.max((1 - widget.scrollPer * opacityRate), 0.5),
      child: Container(
        width: deviceSize.width,
        height: deviceSize.height * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
          color: Colors.black,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Transform.translate(
            offset: Offset(
                0,
                math.min(
                  0,
                  _is70PerScrolled
                      ? (_tranformYReverse.toDouble())
                      : _transformYValue,
                )),
            child: Transform.scale(
              scale: math.max(
                1,
                _is70PerScrolled ? _scaleValue70 : _scaleValue,
              ),
              // child: const MagazinePageView(),
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Image.asset(
                  widget.imagePath,
                  // width: 200,
                  // height: 250,
                ),
              ),
            ),
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
    _controller = PageController(
      initialPage: 0,
    );
    _controller.addListener(() {
      pageOffset = _controller.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
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
