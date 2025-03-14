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
    final displayUsers = users.length > 8 ? users.sublist(0, 8) : users;
    final count = displayUsers.length;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding = MediaQuery.of(context).padding;

    final availableHeight = screenHeight -
        safeAreaPadding.top -
        safeAreaPadding.bottom -
        kBottomNavigationBarHeight -
        72;

    const spacing = 4.0;

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
        gridHeight = availableHeight - 4;
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

    final cardWidth = (screenWidth - (columns + 1) * spacing - 20) / columns;
    final cardHeight = (gridHeight - (rows + 1) * spacing - 24) / rows;

    return Container(
      color: Colors.black,
      width: screenWidth,
      height: availableHeight,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: gridHeight - 4,
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
            if (hasFullWidthBottom)
              SizedBox(
                height: bottomHeight - 4,
                width: screenWidth - spacing * 2 - 20,
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
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/circle_user3.svg',
              height: height * 0.3,
              width: width * 0.3,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                user,
                style: const TextStyle(color: Colors.white, fontSize: 11),
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
