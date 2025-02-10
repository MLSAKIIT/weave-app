import 'package:flutter/material.dart';
import 'package:weave_app/utils/background.dart';

class ResetLinkSent extends StatelessWidget {
  const ResetLinkSent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        const Background(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: size.height / 4,
              bottom: size.height / 4,
              left: size.width / 15,
            ),
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.src,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height / 5,
                    bottom: size.height / 50,
                    left: size.width / 7,
                    right: size.width / 7,
                  ),
                  child: const Text(
                    'Reset link has been sent',
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height / 5),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          text: "Didn't recieve the link?",
                        ),
                        // try again link, tap functionality to be implemented
                        // once redirection link is produced
                        TextSpan(
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                          ),
                          text: " Try again",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
