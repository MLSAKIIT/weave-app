import 'package:flutter/material.dart'; // Import Flutter's material design package.

class StarOverlay extends StatelessWidget {
  const StarOverlay({super.key}); // Constructor for the widget.

  @override
  Widget build(BuildContext context) {
    return Positioned.fill( // will fill the while screen with stars
      child: Image.asset(
        "ase/star.png", // the name of my assets folder is ase
        fit: BoxFit.cover, // no distortion will be there
        opacity: const AlwaysStoppedAnimation(1), // 1 means full opacity.
      ),
    );
  }
}
