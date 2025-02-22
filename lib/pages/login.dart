import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/customTextField.dart';
import 'package:weave_app/custom_widgets/customButton.dart';
import 'package:weave_app/custom_widgets/background.dart';
import 'package:weave_app/pages/SignUp.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.1;
    final verticalPadding = screenHeight * 0.25;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Background(boxPaddingHorizontal: 0.1, boxPaddingVertical: 0.2),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Log In',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.07),
                  const CustomTextField(
                    hintText: 'Email',
                    icon: 'assets/icons/mail.svg',
                    isEmail: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const CustomTextField(
                    hintText: 'Password',
                    icon: 'assets/icons/eye_visibility_toggle.svg',
                    isPassword: true,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    text: 'Log In',
                    onPressed: () {
                    },
                    color: primaryColor,
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
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
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
