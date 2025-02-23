import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class MemberGrid extends StatelessWidget {
  final String title;
  final List<String> memberImages;
  final double spacing;

  const MemberGrid({
    super.key,
    required this.title,
    required this.memberImages,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title Card
        Card.filled(
          color: const Color(0xff101426),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Members Grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemCount: memberImages.length,
            itemBuilder: (context, index) {
              return _buildMemberTile(memberImages[index]);
            },
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildMemberTile(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff101426),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
