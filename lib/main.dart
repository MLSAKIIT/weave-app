import 'package:flutter/material.dart';
import 'package:weave_app/pages/about_us.dart';
import 'package:weave_app/pages/email_verified.dart';
import 'package:weave_app/pages/login.dart';
import 'package:weave_app/pages/profile_page.dart';
import 'package:weave_app/pages/reset_link_sent.dart';
import 'package:weave_app/pages/signup.dart';
import 'package:weave_app/pages/splashScreen.dart';
import 'package:weave_app/pages/email_sent.dart';
import 'package:weave_app/pages/reconnect.dart';
import 'package:weave_app/pages/Preview.dart';
import 'package:weave_app/pages/meeting_interface.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash',
    routes: {
      '/splash': (context) => SplashScreen(),
      '/': (context) => const Login(),
      '/Login': (context) => const Login(),
      '/SignUp': (context) => const SignUp(),
      '/email-verified': (context) => const EmailVerifiedPage(),
      '/reset-link-sent': (context) => const ResetLinkSent(),
      '/email-sent': (context) => const EmailSentPage(),
      '/reconnect': (context) => const ReconnectPage(),
      '/preiview': (context) => const Preview(),
      '/profile-page': (context) => const ProfilePage(),
      '/about-us': (context) => const AboutUsPage(),
      '/meeting': (context) => const MeetingPage(),
    },
    theme: ThemeData(
      primaryColor: const Color(0xFFE76F04),
      scaffoldBackgroundColor: const Color(0xFF070910),
    ),
  ));
}
