import 'package:flutter/material.dart';
import 'package:weave_app/custom_widgets/customTextField.dart';
import 'package:weave_app/custom_widgets/customButton.dart';
import 'package:weave_app/pages/Login.dart';
import 'package:weave_app/custom_widgets/background.dart';
import 'package:weave_app/custom_widgets/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _termsAgreed = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.1;
    final verticalPadding = screenHeight * 0.17;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Background(
            boxPaddingHorizontal: 0.1,
            boxPaddingVertical: 0.15,
          ),
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
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    hintText: 'Name',
                    icon: 'assets/icons/person.svg',
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                    controller: _passwordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    icon: 'assets/icons/eye_visibility_toggle.svg',
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: screenWidth * 0.055),
                        Checkbox(
                          value: _termsAgreed,
                          onChanged: (bool? value) {
                            setState(() {
                              _termsAgreed = value ?? false;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              const Text(
                                "I agree to the ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "terms and conditions",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Passwords do not match")),
                        );
                        return;
                      }
                      if (!_termsAgreed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  "You must agree to the Terms and Conditions")),
                        );
                        return;
                      }
                    },
                    color: primaryColor,
                    widthFactor: 0.5,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?? ",
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
                                builder: (context) => const Login()),
                          );
                        },
                        child: const Text(
                          "Login here",
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
