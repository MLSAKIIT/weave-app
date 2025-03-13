import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class ParticipantsTile extends ConsumerWidget {
  final List<String> users;

  const ParticipantsTile({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Limit to 8 users max
    final displayUsers = users.length > 8 ? users.sublist(0, 8) : users;
    final count = displayUsers.length;

    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding = MediaQuery.of(context).padding;

    // Calculate available height with increased bottom padding to fix overflow
    final availableHeight = screenHeight -
        safeAreaPadding.top -
        safeAreaPadding.bottom -
        kBottomNavigationBarHeight -
        72; // Increased from 60 to 72 to prevent overflow with 6 users

    // Reduced spacing to avoid overflow
    const spacing = 4.0; // Reduced from 5.0 to 4.0

    // Layout configuration based on user count
    int rows = 1;
    int columns = 1;
    bool hasFullWidthBottom = false;
    double gridHeight = availableHeight;
    double bottomHeight = 0;

    switch (count) {
      case 1:
        rows = 1;
        columns = 1;
        break;
      case 2:
        rows = 2;
        columns = 1;
        break;
      case 3:
        rows = 3;
        columns = 1;
        break;
      case 4:
        rows = 2;
        columns = 2;
        break;
      case 5:
        rows = 2;
        columns = 2;
        hasFullWidthBottom = true;
        gridHeight = availableHeight * 2 / 3 - spacing;
        bottomHeight = availableHeight * 1 / 3 - spacing * 2;
        break;
      case 6:
        rows = 3;
        columns = 2;
        // Special adjustment for 6 users to prevent overflow
        gridHeight = availableHeight - 4; // Extra 4px safety margin
        break;
      case 7:
        rows = 3;
        columns = 2;
        hasFullWidthBottom = true;
        gridHeight = availableHeight * 3 / 4 - spacing;
        bottomHeight = availableHeight * 1 / 4 - spacing * 2;
        break;
      case 8:
        rows = 4;
        columns = 2;
        break;
    }

    // Calculate card dimensions with more careful spacing
    final cardWidth = (screenWidth - (columns + 1) * spacing - 20) /
        columns; // Increased from 18 to 20
    final cardHeight = (gridHeight - (rows + 1) * spacing - 24) /
        rows; // Increased from 22 to 24

    return Container(
      color: Colors.black,
      width: screenWidth,
      height: availableHeight,
      child: Padding(
        // Further reduced padding to avoid overflow
        padding: const EdgeInsets.all(4.0), // Reduced from 5.0 to 4.0
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Grid layout for main cards
            SizedBox(
              height: gridHeight - 4, // Increased safety margin from 2 to 4
              child: count <= 3
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < count; i++)
                          _buildCard(
                            user: displayUsers[i],
                            width: cardWidth,
                            height: cardHeight,
                          ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int r = 0;
                            r <
                                (hasFullWidthBottom
                                    ? rows
                                    : (count / columns).ceil());
                            r++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int c = 0; c < columns; c++)
                                if (r * columns + c <
                                    (hasFullWidthBottom ? count - 1 : count))
                                  _buildCard(
                                    user: displayUsers[r * columns + c],
                                    width: cardWidth,
                                    height: cardHeight,
                                  ),
                            ],
                          ),
                      ],
                    ),
            ),

            // Bottom full-width card if needed
            if (hasFullWidthBottom)
              SizedBox(
                height: bottomHeight - 4, // Increased safety margin from 2 to 4
                width:
                    screenWidth - spacing * 2 - 20, // Increased from 18 to 20
                child: _buildCard(
                  user: displayUsers[count - 1],
                  width: screenWidth - spacing * 2 - 20,
                  height: bottomHeight - 4,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String user,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      // Further reduced margin to avoid overflow
      margin: const EdgeInsets.all(1.5), // Reduced from 2 to 1.5
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8), // Reduced from 10 to 8
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/circle_user3.svg',
              // Further reduced the SVG size
              height: height * 0.3, // Reduced from 0.33 to 0.3
              width: width * 0.3, // Reduced from 0.33 to 0.3
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 3), // Reduced from 4 to 3
            // Text with overflow protection
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2.0), // Reduced from 3.0 to 2.0
              child: Text(
                user,
                style: const TextStyle(
                    color: Colors.white, fontSize: 11), // Reduced from 12 to 11
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
