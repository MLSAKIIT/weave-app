// import 'package:flutter/material.dart';
// import 'package:weave_app/pages/email_verified.dart';
// import 'package:weave_app/pages/Login.dart';
// import 'package:weave_app/pages/reset_link_sent.dart';
// import 'package:weave_app/pages/SignUp.dart';
// import 'package:weave_app/pages/splashScreen.dart';
// import 'package:weave_app/pages/email_sent.dart';
// import 'package:weave_app/pages/reconnect.dart';
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: '/splash',
//     routes: {
//       // Initial Routes
//       '/splash': (context) => SplashScreen(),
//       '/': (context) => const Login(),
//
//       // Auth Routes
//       '/Login': (context) => const Login(),
//       '/SignUp': (context) => const SignUp(),
//       '/email-verified': (context) => const EmailVerifiedPage(),
//       '/reset-link-sent': (context) => const ResetLinkSent(),
//       '/email-sent': (context) => const EmailSentPage(),
//
//       // Meeting Routes
//       '/reconnect': (context) => const ReconnectPage(),
//
//       // Add other routes as needed
//     },
//     theme: ThemeData(
//       primaryColor: const Color(0xFFE76F04),
//       scaffoldBackgroundColor: const Color(0xFF070910),
//     ),
//   ));
// }





import 'package:flutter/material.dart';
import 'package:weave_app/pages/Preview.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Preview(),
    );
  }
}
