import 'package:flutter/material.dart'; 
import '../custom_widget/star_overlay_ab.dart'; 
import '../custom_widget/orange_glow_ab.dart'; 

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // Get the screen size for responsive UI.

    return Scaffold(
      body: Stack( 
        children: [
          Container(color: Colors.black), // Background color set to black.
          const StarOverlay(), // Custom widget to display star-like overlay effects.
          const OrangeGlow(top: -110, left: -100), // Custom widget for an orange glow at the top-left.
          const OrangeGlow(top: 650, left: 250), // Another orange glow at the bottom-right.

          // Positioned widget is used to place the confirmation box at a specific position.
          Positioned(
            top: screenSize.height * 0.25, 
            left: screenSize.width * 0.08, 
            child: Container(
              width: screenSize.width * 0.85, 
              height: screenSize.height * 0.55, 
              padding: EdgeInsets.all(screenSize.width * 0.05), 
              decoration: BoxDecoration(
                color: const Color.fromARGB(178, 0, 0, 0), // Semi-transparent black background.
                borderRadius: BorderRadius.circular(12), // Rounded corners 
              ),
              child: Column( // Column to arrange text and icon vertically.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Text(
                    "The link has been",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter", 
                      fontSize: 24, 
                      fontWeight: FontWeight.w400, 
                      height: 29.05 / 24, 
                      color: Color(0xFFE76F04), 
                    ),
                  ),
                  const SizedBox(height: 5), // Small spacing between the two text lines.

                  // Second line of text
                  const Text(
                    "sent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 29.05 / 24,
                      color: Color(0xFFE76F04),
                    ),
                  ),
                  
                  SizedBox(height: screenSize.height * 0.04), // Space before the check icon.

                  // Checkmark icon to indicate success.
                  const Icon(Icons.check_circle, color: Color(0xFFE76F04), size: 35),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
