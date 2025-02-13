import 'package:flutter/material.dart'; 
import '../custom_widgets/star_overlay_ab.dart'; 
import '../custom_widgets/orange_glow_ab.dart'; 

class EmailVerifiedPage extends StatelessWidget {
  const EmailVerifiedPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; 

    return Scaffold(
      body: Stack( 
        children: [
          Container(color: Colors.black), // Background color set to black.
          const StarOverlay(), // Custom widget to display star-like overlay effects.
          const OrangeGlow(top: -110, left: -100), // Custom widget for an orange glow at the top-left.
          const OrangeGlow(top: 650, left: 250), // Another orange glow at the bottom-right.

          // Positioned widget to place a container in the center of the screen.
          Positioned(
            top: screenSize.height * 0.25, 
            left: screenSize.width * 0.08, 
            child: Container(
              width: screenSize.width * 0.85, 
              height: screenSize.height * 0.55, 
              padding: EdgeInsets.all(screenSize.width * 0.05), 
              decoration: BoxDecoration(
                color: const Color.fromARGB(178, 0, 0, 0), // Semi-transparent black background.
                borderRadius: BorderRadius.circular(12), 
              ),
            ),
          ),

          // Second Positioned widget containing the text and button.
          Positioned(
            top: screenSize.height * 0.41, 
            left: screenSize.width * 0.08, // Aligning it with the first box.
            child: Container(
              width: screenSize.width * 0.85, // Same width as the first container.
              height: screenSize.height * 0.250, 
              padding: EdgeInsets.all(screenSize.width * 0.05), 
              decoration: BoxDecoration(
                color: const Color.fromARGB(64, 0, 0, 0), // More transparent black background.
                borderRadius: BorderRadius.circular(12), 
              ),
              child: Column( // Column to arrange text and button vertically.
                mainAxisAlignment: MainAxisAlignment.center, // Centering items in the column.
                children: [
                  // Text displaying email verification success.
                  const Text(
                    "Your email has been verified",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter", 
                      fontSize: 24, 
                      fontWeight: FontWeight.w400, 
                      height: 29.05 / 24, 
                      color: Color(0xFFE76F04), 
                    ),
                  ),
                  
                  SizedBox(height: screenSize.height * 0.08), // Space before the button.

                  // Button to navigate to the home screen.
                  SizedBox(
                    width: screenSize.width * 0.6, 
                    height: screenSize.height * 0.07, 
                    child: ElevatedButton(
                    onPressed: null,

                      // onPressed: () {
                      //   Navigator.pushNamed(context, '/sent'); // will update the route later
                      // },         


                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE76F04), // Orange background color.
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), 
                        ),
                      ),
                      child: const Text(
                        "Go To Home",
                        style: TextStyle(
                          fontFamily: "Inter", 
                          fontSize: 20, 
                          fontWeight: FontWeight.w400, 
                          height: 24.2 / 20, 
                          color: Colors.black, 
                        ),
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
