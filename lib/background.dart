import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0x4DE76F04),
                  Color(0x26E76F04),
                  Colors.transparent
                ],
                center: Alignment.topLeft,
                stops: [0.0, 0.3, 1.4],
                radius: 1.0,
                focalRadius: 0.3,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0x33E76F04),
                  Color(0x26E76F04),
                  Colors.transparent
                ],
                center: Alignment(0.6, 0.6),
                stops: [0.0, 0.2, 0.6],
                radius: 1.0,
                focalRadius: 0.3,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/backgrounds/stars_background.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
