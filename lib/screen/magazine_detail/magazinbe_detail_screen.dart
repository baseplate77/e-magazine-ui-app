import 'dart:async';

import 'package:e_magazine_ui/screen/magazine_detail/widget/magazine_header_delegate.dart';
import 'package:flutter/material.dart';

class MagazineDetailScreen extends StatefulWidget {
  const MagazineDetailScreen({Key? key}) : super(key: key);

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
                  minExented: 90,
                  maxExented: deviceSize.height * 0.85,
                  deviceSize: deviceSize,
                ),
              ),
              // BODY PART
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.black12,
                  height: 1000,
                  child: Image.asset("assets/images/music-album.jpg"),
                ),
              ),
            ],
          ),
          // APP BAR OPTIONS
          Positioned(
              top: 45,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ],
              )),
          // BOOKMARK BUTTON
          // Positioned(
          //     top: deviceSize.height * 0.6 - 35,
          //     right: 20,
          //     child: Container(
          //       padding: const EdgeInsets.all(5),
          //       decoration: BoxDecoration(
          //           color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          //       child: Column(
          //         children: const [
          //           Icon(
          //             Icons.favorite,
          //             color: Colors.white,
          //           ),
          //           Divider(
          //             color: Colors.black26,
          //           ),
          //           Icon(
          //             Icons.bookmark,
          //             color: Colors.white,
          //           ),
          //         ],
          //       ),
          //     )),
        ],
      ),
    );
  }
}
