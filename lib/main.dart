import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/screens/auth/email_verification_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_in_screen.dart';
import 'package:pccoe_hackathon/screens/auth/sign_up_screen.dart';
import 'package:pccoe_hackathon/screens/carousel/causcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'down syndrome detection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignupScreen(),
      routes: {
        SigninScreen.routeName: (context) => const SigninScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        EmailVerificationScreen.routeName: (context) =>
            const EmailVerificationScreen()
      },
    );
  }
}
