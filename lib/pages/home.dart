import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/star_overlay_ab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showContainer = false; // Controls the visibility of the pop-up container

  // method to create a menu item with an icon, text, and onTap callback
  Widget _menuItem(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFE76F04)), 
            const SizedBox(width: 10), // Spacing between icon and text
            Text(text, style: const TextStyle(color: Color(0xFFE76F04))), 
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; 
    final screenHeight = MediaQuery.of(context).size.height; 

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Hide the container if it's visible
          if (_showContainer) {
            setState(() {
              _showContainer = false;
            });
          }
        },
        child: Stack(
          children: [
            // Background container
            Container(color: Colors.black),

            // Star overlay widget
            const StarOverlay(),

            // Weave logo positioned at the top-left
            
Positioned(
  top: screenHeight * 0.02, 
  left: screenWidth * 0.05, 
  child: SizedBox(
    width: 88, 
    height: 88, 
    child: Image.asset('assets/icons/weave_logo.png'), 
  ),
),

// Profile icon positioned at the top-right
Positioned(
  top: screenHeight * 0.05, 
  left: screenWidth * 0.82, 
  child: GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/demo-profile'); // Navigate to profile page
    },
    child: SizedBox(
      width: 25, 
      height: 25,
      child: Image.asset('assets/icons/profile.png'), 
    ),
  ),
),

// Three-bar menu icon positioned at the top-right
Positioned(
  top: screenHeight * 0.045, 
  left: screenWidth * 0.90, 
  child: GestureDetector(
    onTap: () {
      setState(() {
        _showContainer = !_showContainer; // Toggle container visibility
      });
    },
    child: SizedBox(
      width: 34, 
      height: 35, 
      child: Image.asset('assets/icons/threeBar.png'), 
    ),
  ),
),

            // Pop-up container (visible when _showContainer is true)
            if (_showContainer)
              Positioned(
                top: 68, 
                left: screenWidth - 180, 
                child: Container(
                  width: 160, // Fixed width
                  padding: const EdgeInsets.symmetric(vertical: 10), 
                  decoration: BoxDecoration(
                    color: Colors.black, 
                    borderRadius: BorderRadius.circular(8), 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
                    children: [
                      // Menu items with onTap callbacks
                      _menuItem(Icons.person, 'Your profile', () {
                        Navigator.pushNamed(context, '/demo-profile'); // Navigate to demo profile page
                      }),
                      _menuItem(Icons.schedule, 'Your meetings', () {
                        Navigator.pushNamed(context, '/demo-meetings'); // Navigate to demo meetings page
                      }),
                      _menuItem(Icons.edit, 'Edit Details', () {
                        Navigator.pushNamed(context, '/demo-edit'); // Navigate to demo edit page
                      }),
                      _menuItem(Icons.info, 'About Us', () {
                        Navigator.pushNamed(context, '/demo-about'); // Navigate to demo about page
                      }),
                      _menuItem(Icons.feedback, 'Feedback', () {
                        Navigator.pushNamed(context, '/demo-feedback'); // Navigate to demo feedback page
                      }),
                      // Logout button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/demo-logout'); // Navigate to demo logout page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE76F04), 
                          ),
                          child: const Text('Logout', style: TextStyle(color: Colors.black)), 
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Keyboard icon (visible when _showContainer is false)
            if (!_showContainer)
              Positioned(
                top: 310, 
                left: screenWidth - 89, 
                child: SizedBox(
                  width: 30, // Fixed width
                  height: 30, // Fixed height
                  child: Image.asset('assets/icons/keyboard.png'), // Keyboard icon
                ),
              ),

            // Weave text positioned at the top-center
            Positioned(
              top: 40, 
              left: screenWidth * 0.25, 
              child: const Text(
                'Weave',
                style: TextStyle(
                  fontFamily: 'Nova Flat', 
                  fontSize: 32, // Font size
                  fontWeight: FontWeight.w400, // Font weight
                  color: Color(0xFFE76F04), // Text color
                ),
              ),
            ),

            // TextField for entering a code or link
            Positioned(
              top: screenHeight * 0.35, 
              left: (screenWidth - 291) / 2, 
              child: SizedBox(
                width: 291, 
                height: 63, 
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter a code or a link', 
                    hintStyle: const TextStyle(
                      fontSize: 24, 
                      color: Color(0xFFF1A650), 
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF1A650), width: 2), // Enabled border
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF1A650), width: 2), // Focused border
                    ),
                  ),
                  style: const TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),

            // Join a Meeting button
            Positioned(
              top: screenHeight * 0.45, 
              left: (screenWidth - 220) / 2, 
              child: SizedBox(
                width: 220, 
                height: 39,
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE76F04), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Join a Meeting',
                    style: TextStyle(fontSize: 20, color: Colors.black), 
                  ),
                ),
              ),
            ),

            // Create button with magic wand icon
            Positioned(
              top: screenHeight * 0.55, 
              left: (screenWidth - 140) / 2, 
              child: SizedBox(
                width: 140, 
                height: 45, 
                child: ElevatedButton(
                  onPressed: () {}, // Placeholder onPressed
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE76F04), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center icon and text
                    children: [
                      Image.asset('assets/icons/Magic_wand.png', width: 20, height: 20), // Magic wand icon
                      const SizedBox(width: 8), // Spacing between icon and text
                      const Text('Create', style: TextStyle(fontSize: 20, color: Colors.black)), // Button text
                    ],
                  ),
                ),
              ),
            ),

            // Description text at the bottom
            Positioned(
              top: screenHeight * 0.75, // Positioned relative to screen height
              left: (screenWidth - 380) / 2, // Centered horizontally
              child: SizedBox(
                width: 380, 
                child: Column(
                  children: const [
                    Text('A complete WebRTC-based video calling app with a', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFFE76F04))),
                    Text('custom SFU server for efficient multi-party streaming', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFFE76F04))),
                    Text('and adaptive bitrate management. It includes a custom', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFFE76F04))),
                    Text('web interface and Android app, ensuring seamless', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFFE76F04))),
                    Text('cross-platform performance, scalability, and security.', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Color(0xFFE76F04))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// App routes for navigation
Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => const HomePage(),
  '/demo-profile': (context) => const DemoPage(title: 'Your Profile'),
  '/demo-meetings': (context) => const DemoPage(title: 'Your Meetings'),
  '/demo-edit': (context) => const DemoPage(title: 'Edit Details'),
  '/demo-about': (context) => const DemoPage(title: 'About Us'),
  '/demo-feedback': (context) => const DemoPage(title: 'Feedback'),
  '/demo-logout': (context) => const DemoPage(title: 'Logout'),
};

// Demo page for routes
class DemoPage extends StatelessWidget {
  final String title;

  const DemoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Page title
      ),
      body: Center(
        child: Text('This is the $title page.'), // Demo content
      ),
    );
  }
}