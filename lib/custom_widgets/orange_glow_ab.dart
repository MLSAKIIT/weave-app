import 'package:flutter/material.dart';

class OrangeGlow extends StatelessWidget {
  final double top;
  final double left;

  const OrangeGlow({super.key, required this.top, required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color(0x4DE76F04), // Semi-transparent orange
              Color(0x26E76F04), // More transparent orange
              Colors.transparent, // Soft fade-out
            ],
            stops: [0.0, 0.3, 1.0], // Fewer stops for a smoother effect
            radius: 1.0, // Spread similar to second version
            focalRadius: 0.3, // Helps with smoothness
            center: Alignment.center, // Matches second glow
          ),
        ),
      ),
    );
  }
}
