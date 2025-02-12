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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFFE76F04).withAlpha(80),
              const Color(0xFFE76F04).withAlpha(50),
              const Color(0xFFE76F04).withAlpha(45),
              const Color(0xFFE76F04).withAlpha(28),
              const Color(0xFFE76F04).withAlpha(25),
              const Color(0xFFE76F04).withAlpha(15),
              const Color(0xFFE76F04).withAlpha(15),
              const Color(0xFFE76F04).withAlpha(10),
              const Color(0xFFE76F04).withAlpha(8),
              const Color(0xFFE76F04).withAlpha(5),
              const Color(0xFFE76F04).withAlpha(3),
            ],
            stops: const [0.0, 0.2, 0.3, 0.4, 0.45, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
            radius: 1.0,
            center: Alignment.center,
          ),
        ),
      ),
    );
  }
}
