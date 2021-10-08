import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> imagePaths = [
    "assets/images/music-album.jpg",
    "assets/images/music-album.jpg",
    "assets/images/music-album.jpg",
    "assets/images/music-album.jpg",
    "assets/images/music-album.jpg",
    "assets/images/music-album.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SwipeDeck(
          startIndex: 3,
          aspectRatio: 4 / 3,
          emptyIndicator: const Center(
            child: Text("Nothing Here"),
          ),
          widgets: imagePaths
              .map((imagePath) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )))
              .toList(),
        ),
      ),
    );
  }
}
