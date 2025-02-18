/// A custom text field widget that allows for configurable text input,
/// including support for password and email input types. When configured as a
/// password field, it includes a toggle to show or hide the entered password.
///
/// The widget supports customization such as hint text, SVG icon display, and
/// configurable text controller.
///
/// Note: - This widget requires the dependency 'flutter_svg' to be added to your pubspec.yaml.
///       - This widget, for now uses svg files as icons explicitly.
///
/// Parameters:
///   - [hintText]: The placeholder text displayed in the text field.
///   - [icon]: The file path for the SVG icon shown in the input field.
///   - [controller]: An optional [TextEditingController] to manage the text.
///   - [isPassword]: A flag indicating if the text field is used for password input.
///                 If true, an option to toggle password visibility is provided, by making the icon clickalble.
///   - [isEmail]: A flag indicating if the text field is used for email input, which
///              automatically sets the keyboard to an email-optimized layout.
///   - [widthFactor]: Optional. A factor to determine the button's width relative to the screen's width. Defaults to 0.7.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isEmail;
  final double widthFactor;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.controller,
    this.isPassword = false,
    this.isEmail = false,
    this.widthFactor = 0.7,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;
  final Color _themeColor = const Color(0xffE76F04);

  UnderlineInputBorder _buildBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: _themeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widget.widthFactor,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && !_isPasswordVisible,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: const TextStyle(color: Color(0xffE76F04), fontSize: 20),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      widget.icon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    widget.icon,
                    width: 20,
                    height: 20,
                  ),
                ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xffE76F04), fontSize: 20),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
