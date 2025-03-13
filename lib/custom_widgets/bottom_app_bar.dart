import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weave_app/custom_widgets/constants.dart';

final handSelectedProvider = StateProvider<bool>((ref) => false);
final micSelectedProvider = StateProvider<bool>((ref) => false);
final vidSelectedProvider = StateProvider<bool>((ref) => false);

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handSelected = ref.watch(handSelectedProvider);
    final micSelected = ref.watch(micSelectedProvider);
    final vidSelected = ref.watch(vidSelectedProvider);

    const buttonSize = 60.0;

    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
        children: <Widget>[
          // Mic Button
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Add horizontal spacing
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: IconButton.filled(
                isSelected: micSelected,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: micSelected
                      ? const Icon(
                          Icons.mic_outlined,
                          key: ValueKey('mic_outlined'),
                        )
                      : const Icon(
                          Icons.mic_off_outlined,
                          key: ValueKey('mic_off_outlined'),
                        ),
                ),
                style: IconButton.styleFrom(
                  backgroundColor: micSelected ? primaryColor : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ref.read(micSelectedProvider.notifier).state = !micSelected;
                },
              ),
            ),
          ),

          // Video Button
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Add horizontal spacing
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: IconButton.filled(
                isSelected: vidSelected,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: vidSelected
                      ? const Icon(
                          Icons.videocam_rounded,
                          key: ValueKey('videocam_rounded'),
                        )
                      : const Icon(
                          Icons.videocam_off_outlined,
                          key: ValueKey('videocam_off_outlined'),
                        ),
                ),
                style: IconButton.styleFrom(
                  backgroundColor: vidSelected ? primaryColor : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ref.read(vidSelectedProvider.notifier).state = !vidSelected;
                },
              ),
            ),
          ),

          // Hand Button
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Add horizontal spacing
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: IconButton.filled(
                isSelected: handSelected,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: handSelected
                      ? const Icon(
                          Icons.back_hand,
                          key: ValueKey('back_hand'),
                        )
                      : const Icon(
                          Icons.back_hand_outlined,
                          key: ValueKey('back_hand_outlined'),
                        ),
                ),
                style: IconButton.styleFrom(
                  backgroundColor: handSelected ? primaryColor : Colors.grey,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ref.read(handSelectedProvider.notifier).state = !handSelected;
                },
              ),
            ),
          ),

          // More Options Button
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Add horizontal spacing
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_outlined),
                  style: IconButton.styleFrom(foregroundColor: Colors.white),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'option1',
                        child: Row(
                          children: [],
                        ),
                      )
                    ];
                  },
                  onSelected: (String value) {},
                ),
              ),
            ),
          ),

          // Call End Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: IconButton(
                  icon: const Icon(Icons.call_end_rounded, color: Colors.white),
                  onPressed: null,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    minimumSize: const Size(buttonSize, buttonSize),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
