import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  String link = "mee-t+c-ode"; // Default Meeting code.
  int people = 0; // Default Number of people.

  @override
  void initState() { // Incorrect method name
    super.initState();
    link = "mee-t+c-ode"; // Default Meeting code. Here, the meeting code will be updated, this will be completed once, the meeting code is given by the user
    people = 0; // Default number of people. Here. no. of people will keep updating.
  }

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
              decoration: const BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Color(0x4DE76F04), Color(0x26E76F04), Colors.transparent],
                      center: Alignment.topLeft,
                      stops: [0.0, 0.3, 1.4],
                      radius: 1.0,
                      focalRadius: 0.3
                  )
              ),
            ),
          ),
          Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Color(0x33E76F04), Color(0x26E76F04), Colors.transparent],
                        center: Alignment(0.6, 0.6),
                        stops: [0.0, 0.2, 0.6],
                        radius: 1.0,
                        focalRadius: 0.3
                    )
                ),
              )
          ),
          Positioned.fill(
              child: Image.asset(
                'assets/backgrounds/stars_background.png',
                fit: BoxFit.cover,
              )
          ),
          Positioned(
            top: screenHeight * (15 / 956),
            left: screenWidth * (30 / 440),
            child: InkWell(
              onTap: () {
                print("Arrow working");
              },
              child: Image.asset(
                  'assets/icons/arrow_back.png'
              ),
            ),
          ),
          Positioned(
              left: screenWidth * (85 / 440),
              top: screenHeight * (114 / 956),
              child: Container(
                height: screenHeight * (717 / 956),
                width: screenWidth * (260 / 440),
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     const Text(
                        "Ready to join?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 36,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * (17 / 698),
                      ),
                      child: Text(
                        link,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Roboto'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * (11 / 698),
                      ),
                      child: Container(
                        height: screenHeight * (450 / 956),
                        width: screenWidth * (260 / 440),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black,
                        ),
                        child: Stack(
                          children: [
                            Center(
                                child: Image.asset(
                                    "assets/icons/circle-user 18.png"
                                )
                            ),
                            Positioned(
                              left: screenWidth * (10 / 260),
                              bottom: screenHeight * (10 / 450),
                              child: InkWell(
                                  onTap: () {
                                    print("Mike Button Working"); // On tap for the mike button
                                  },
                                  child: Image.asset(
                                      "assets/icons/Mike.png"
                                  )
                              ),
                            ),
                            Positioned(
                              right: screenWidth * (10 / 260),
                              bottom: screenHeight * (10 / 450),
                              child: InkWell(
                                  onTap: () {
                                    print("Video Button Working"); // on tap for the video button
                                  },
                                  child: Image.asset(
                                      "assets/icons/Video.png"
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenWidth * (20 / 440),
                            top: screenHeight * (40 / 956),
                          ),
                          child: SizedBox(
                            height: screenHeight * (45 / 956),
                            width: screenWidth * (120 / 440),
                            child: ElevatedButton(
                              onPressed: () {
                                print("Cancel Button Working");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE76F04),
                                foregroundColor: const Color(0xFF000000),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 16,
                                    fontFamily: 'Roboto'
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * (40 / 956),
                          ),
                          child: SizedBox(
                            height: screenHeight * (45 / 956),
                            width: screenWidth * (120 / 440),
                            child: ElevatedButton(
                              onPressed: () {
                                print("Join button working");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE76F04),
                                foregroundColor: const Color(0xFF000000),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                              child: const Text(
                                "Join",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 16,
                                    fontFamily: 'Roboto'
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * (27 / 956),
                      ),
                      child: Text(
                        "$people are in the meeting",
                        style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
