import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccoe_hackathon/screens/auth/sign_up_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();

  static const routeName = '/sign-in';
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/sign_in.png"),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Welcome Back!",
              style:
                  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Login to continue",
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your email Id",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the password",
                    style: GoogleFonts.roboto(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(
                  255,
                  13,
                  132,
                  201,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Dont have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignupScreen.routeName);
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 13, 132, 201),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
