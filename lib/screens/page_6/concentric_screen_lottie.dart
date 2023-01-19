import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/screens/page_6/card_planet.dart';
import 'package:lottie/lottie.dart';
// import '../../widgets/my_drawer.dart';

class ConcentricPageScreen extends StatelessWidget {
  ConcentricPageScreen({super.key});

  static const id = "concentric_page_screen";
  final data = [
    CardPlanetData(
      title: "observe",
      subtitle:
          "The night sky has much to offer to those who seek its mystery.",
      image: const AssetImage("assets/images/img-1.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animations/bg-1.json"),
    ),
    CardPlanetData(
      title: "imagine",
      subtitle: "An endless number of galaxies means endless possibilities.",
      image: const AssetImage("assets/images/img-2.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animations/bg-2.json"),
    ),
    CardPlanetData(
      title: "stargaze",
      subtitle: "The sky dome is a beautiful graveyard of stars.",
      image: const AssetImage("assets/images/img-3.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.yellow,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animations/bg-1.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(
      //     size: 25, //change size on your need
      //     color: Colors.black, //change color on your need
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      // drawer: const MyDrawer(),
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          return CardPlanet(data: data[index]);
        },
      ),
    );
  }
}
