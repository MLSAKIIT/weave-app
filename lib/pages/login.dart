import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/customTextField.dart';
import 'package:weave_app/custom_widgets/customButton.dart';
import 'package:weave_app/custom_widgets/background.dart';
import 'package:weave_app/pages/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
      final screenWidth  = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
  
    final horizontalPadding = screenWidth * 0.1;
    final verticalPadding   = screenHeight * 0.25;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(boxPaddingHorizontal: 32, boxPaddingVertical: 192),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, 
                vertical: verticalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: const Color(0xffe76f04),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07), 
                  CustomTextField(
                    hintText: 'Email',
                    icon: 'assets/icons/mail.svg',
                    isEmail: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    hintText: 'Password',
                    icon: 'assets/icons/eye_visibility_toggle.svg',
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    text: 'Log In',
                    onPressed: () {},
                    color: const Color(0xffe76f04),
                    widthFactor: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const signup()),
                          );
                        },
                        child: const Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}