import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weave_app/utils/background.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  ResetPasswordState createState() {
    return ResetPasswordState();
  }
}

class ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        const Background(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width / 15,
              vertical: size.height / 4,
            ),
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.src,
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width / 20,
                right: size.width / 20,
                top: size.height / 12,
                bottom: size.height / 6,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height / 22,
                        bottom: size.height / 18,
                      ),
                      // Validators to be added later
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: primaryColor),
                          suffixIcon: Icon(Icons.email, color: primaryColor),
                        ),
                      ),
                    ),
                    // buttom does nothing right now, functionality
                    // to be added later
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all<Size>(
                          const Size(200.0, 50.0),
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            WidgetStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: null,
                      child: Text(
                        'Send Link',
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
