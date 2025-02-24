import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class Cardbox extends StatelessWidget {
  final String description;
  final String title;
  final String imageurl;
  final double bottomspace;
  const Cardbox(
      {super.key,
      required this.description,
      required this.title,
      required this.imageurl, this.bottomspace=12});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xff101426),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: bottomspace,
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          radius: 32,
          backgroundColor: primaryColor,
          child: Image.asset(
            imageurl,
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }
}
