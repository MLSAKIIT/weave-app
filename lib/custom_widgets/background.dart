import 'package:flutter/material.dart';

///Use to import the starry background with the gradient, pass the values boxPaddingVertical and boxPaddingHorizontal to specify the values of padding of the box on both sides
class Background extends StatelessWidget {
  final double boxPaddingVertical;
  final double boxPaddingHorizontal;
  const Background(
      {required this.boxPaddingHorizontal, required this.boxPaddingVertical});

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
                    focalRadius: 0.3)),
          ),
        ),
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
                    focalRadius: 0.3)),
          ),
        ),
        Positioned.fill(
            child: Image.asset(
          'assets/star.png',
          fit: BoxFit.cover,
        )),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width * boxPaddingHorizontal,
              vertical:
                  MediaQuery.of(context).size.height * boxPaddingVertical),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF070910),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  colors: [
                    Color(0x33E76F04),
                    Color(0x1AE76F04),
                    Colors.transparent
                  ],
                  center: Alignment(0.6, 0.67),
                  stops: [0.01, 0.25, 0.7],
                  radius: 1.0,
                  focalRadius: 0.3)),
        )),
      ],
    );
  }
}
