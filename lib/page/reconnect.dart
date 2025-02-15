import 'package:flutter/material.dart';

class ReconnectPage extends StatefulWidget {
  const ReconnectPage({super.key});

  @override
  State<ReconnectPage> createState() => _ReconnectPageState();
}

class _ReconnectPageState extends State<ReconnectPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration:BoxDecoration(
                gradient: RadialGradient(
                    colors: [Color(0x4DE76F04),Color(0x26E76F04),Colors.transparent],
                    center: Alignment.topLeft,
                    stops: [0.0,0.3,1.4],
                    radius: 1.0,
                    focalRadius: 0.3
                )
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Color(0x33E76F04),Color(0x26E76F04),Colors.transparent],
                      center: Alignment(0.6, 0.6),
                      stops: [0.0,0.2,0.6],
                      radius: 1.0,
                      focalRadius: 0.3
                  )
              ),
            )
        ),
        Positioned.fill(
            child: Image.asset(
              'assets/stars_background.png',
              fit: BoxFit.cover,
            )
        ),
        Positioned(
          top: screenHeight * (181/956),
          left: screenWidth * (30/440),
          right: screenWidth * (30/440),
          child: Container(
            height: screenHeight * (593/956),
            width: screenWidth * (380/440),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
            children:[
              Image.asset(
              "assets/Group 142.png",
              fit: BoxFit.cover,
                height: double.infinity, // Covers complete container
                width: double.infinity, // Covers complete container
            ),
                        Center(
                          child: Container(
                          width: screenWidth * (335/440),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // To tightly wrap all the child to center without using extra space
                          children: [
                            Text(
                          'You have left the meeting',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFE76F04),
                              fontSize: 28,
                            decoration: TextDecoration.none // To remove the yellow lines coming on text
                          ),
                        ),
                          InkWell(
                            onTap: () {}, // Reconnect Button - On Click or On Tap
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: screenHeight * (27/341),
                                ),
                                child: SizedBox(
                                  width: screenWidth * (210/335),
                                  height: screenHeight * (40/341),
                                  child: Image.asset(
                                    'assets/ReconnectButton.png',
                                ),
                                ),
                              ),
                          ),
                              Positioned (
                                top: screenHeight * (290/341),
                                child: InkWell(
                            onTap: () {}, // Exit Meeting - On Click or On Tap
                            child: SizedBox(
                            child: Image.asset(
                                'assets/Group 145.png',
                            width: screenWidth * (210/335),
                            height: screenHeight * (40/341),
                            ),
                            ),
                          ),
                              ),
                          // Spacer(),
                          ],
                        ),
                        ),
                        ),
            ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}


