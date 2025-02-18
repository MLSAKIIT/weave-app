/// A customizable button widget that adapts its width based on the available screen size.
///
/// The CustomButton widget is a [StatelessWidget] that wraps an [ElevatedButton] within a [SizedBox]. 
/// The width of the button is determined by multiplying the screen width by the [widthFactor].
///
/// Parameters:
/// - [text]: The text to display on the button.
/// - [onPressed]: The callback function to execute when the button is pressed.
/// - [color]: Optional. The background color of the button. Defaults to [Colors.orangeAccent].
/// - [widthFactor]: Optional. A factor to determine the button's width relative to the screen's width. Defaults to 0.7.
///
/// The button is styled with rounded corners, specific padding, and uses a black text style with a font size of 16.
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double widthFactor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.orangeAccent,
    this.widthFactor = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
