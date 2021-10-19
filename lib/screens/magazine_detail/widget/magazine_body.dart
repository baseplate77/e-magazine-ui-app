import 'package:e_magazine_ui/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MagazineBody extends StatelessWidget {
  const MagazineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: Colors.black,
      child: Column(
        children: [
          // DUMMAY DATA FOR MAGAZINE DETAIL
          Text(
            "On The Plasticity of an Actor".toUpperCase(),
            style: kText24.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Now, the Korean Cultural Center in the United Arab Emirates is organising a Squid Game-themed event, where contestants can take part in a series of Korean childrens’ games inspired by the show. There won’t be any killings or a \$38 million cash prize, but participants will be in for the chance of winning a coveted green tracksuit, as worn by the characters on the show.",
            style: kText18.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/images/mg_bg.jpeg"),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Photos from the set — shared by a Kate McKinnon fan page — show the pair in what appears to be full costume, with McKinnon in a leopard and floral-printed top (what else?). MacLachlan’s Howard wears tan trousers with a mobile phone holder attached at the belt (the king of wild style he is, sadly, not).",
            style: kText18.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "John Cameron Mitchell is also set to star in Joe Exotic, as the titular character, alongside Nat Wolff, Sam Keeley, and Brian Van Holt.",
            style: kText18.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "In case you missed out on the whole Tiger King phenomenon the first time around, the producers of the miniseries sum the story up in a handy synopsis: “Joe Exotic is a limited series based on true events following Carole Baskin (McKinnon), a big cat enthusiast, who learns that fellow exotic animal lover Joe ‘Exotic’ Schreibvogel is breeding and using his big cats for profit.”",
            style: kText18.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
