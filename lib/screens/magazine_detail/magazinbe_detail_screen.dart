import 'package:e_magazine_ui/core/animations/slide_animation.dart';
import 'package:flutter/material.dart';

import 'widget/magazine_body.dart';
import 'widget/magazine_header_delegate.dart';

class MagazineDetailScreen extends StatefulWidget {
  const MagazineDetailScreen(
      {Key? key, required this.imagePath, required this.tag})
      : super(key: key);
  final String imagePath;
  final String tag;

  @override
  _MagazineDetailScreenState createState() => _MagazineDetailScreenState();
}

class _MagazineDetailScreenState extends State<MagazineDetailScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // MAIN SCROLLABLE CONTENT
          CustomScrollView(
            slivers: [
              // HEADER PART
              SliverPersistentHeader(
                pinned: true,
                delegate: MagazinHeaderDelegate(
                  imagePath: widget.imagePath,
                  tag: widget.tag,
                  minExented: 90,
                  maxExented: deviceSize.height * 0.85,
                  deviceSize: deviceSize,
                ),
              ),
              // BODY PART
              const SliverToBoxAdapter(
                //  MAGAZINE BODY
                child: SlideAnimation(
                  duration: Duration(milliseconds: 450),
                  begin: Offset(0, 100),
                  child: MagazineBody(),
                ),
              ),
            ],
          ),
          // APP BAR OPTIONS
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SlideAnimation(
                  duration: const Duration(milliseconds: 450),
                  begin: const Offset(-200, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ),
                const SlideAnimation(
                  duration: Duration(milliseconds: 450),
                  begin: Offset(200, 0),
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
