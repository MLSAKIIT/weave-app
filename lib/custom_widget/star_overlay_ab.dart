import 'package:flutter/material.dart';

class StarOverlay extends StatelessWidget {
  const StarOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "ase/star.png", // Ensure this path is correct
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation(1),
      ),
    );
  }
}
