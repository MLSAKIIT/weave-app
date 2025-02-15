import 'package:flutter/material.dart';

class StarOverlay extends StatelessWidget {
  const StarOverlay({super.key}); // Constructor for the widget.

  @override
  Widget build(BuildContext context) {
    return Positioned.fill( // will fill the while screen with stars
      child: Image.asset(
        "assets/star.png", // the name of my assets folder is ase
        fit: BoxFit.cover, // no distortion will be there
        opacity: const AlwaysStoppedAnimation(1), // 1 means full opacity.
      ),
    );
  }
}
