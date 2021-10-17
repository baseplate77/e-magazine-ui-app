import 'dart:ui';

import 'package:e_magazine_ui/constant.dart';
import 'package:e_magazine_ui/core/animations/page_transition.dart';
import 'package:e_magazine_ui/core/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:e_magazine_ui/screens/magazine_detail/magazinbe_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
            tileMode: TileMode.clamp,
            stops: [0.4, 0.7],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/full-logo.png",
                    width: 150,
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/scanner.png",
                    color: Colors.white,
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
              // SEARCH BAR
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // MAGAZINE DECK
              SizedBox(
                height: 300,
                child: SwipeDeck(
                  startIndex: 3,
                  aspectRatio: 1.5,
                  emptyIndicator: const Center(
                    child: Text("Nothing Here"),
                  ),
                  widgets: imagePaths.asMap().entries.map((img) {
                    final tag = "image-${img.key}";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: MagazineDetailScreen(
                              imagePath: img.value,
                              tag: tag,
                            ),
                            duration: const Duration(milliseconds: 400),
                            type: PageTransitionType.scaleUpWithFadeIn,
                          ),
                        );
                      },
                      child: Image.asset(
                        img.value,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              // RECOMMENDATION

              Text(
                "All magazine",
                style: kText18.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recomImagePaths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: AspectRatio(
                          aspectRatio: 0.7,
                          child: Image.asset(
                            recomImagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
