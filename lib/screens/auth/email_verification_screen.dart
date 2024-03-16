import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccoe_hackathon/screens/auth/sign_up_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();

  static const routeName = '/verify-email';
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/verification.jpeg"),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "OTP Verification",
              style:
                  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "We have sent the code verification",
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 60,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              pinTheme: PinTheme(
                activeColor: Color.fromARGB(255, 13, 132, 201),
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
              ),
              onCompleted: (val) {},
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
                  "Verify",
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
          ],
        ),
      ),
    );
  }
}
