import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pccoe_hackathon/providers/model_data_provider.dart';
import 'package:pccoe_hackathon/screens/ResultScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static const routeName = '/home-screen';
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<TFLiteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
          255,
          13,
          132,
          201,
        ),
        title: Text(
          "Down syndrome detection",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload an Image",
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "upload scanned ultrasonic image of the brain",
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                _provider.uploadImageFromGallery();
              },
              child: Consumer<TFLiteProvider>(
                builder: (context, value, child) {
                  if (value.image == null) {
                    return Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 13, 132, 201)
                              .withOpacity(0.5),
                          border: Border.all(
                              color: Color.fromARGB(255, 13, 132, 201),
                              width: 4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload,
                              color: Color.fromARGB(255, 13, 132, 201),
                              size: 50,
                            ),
                            Text("Tap here to upload image")
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 13, 132, 201),
                              width: 4),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(value.image!))),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                _provider.runInference();
              },
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          advise: "Immediate medical help required!",
                          reasons: [
                            "Trisomy 21",
                            "Mosaic Down Syndrome",
                            "Translocation Down Syndrome",
                            "Advanced Maternal Age"
                          ],
                          diagnosis: "First-Trimester Combined Screening",
                          doctors: [
                            "Dipen Sharma",
                            "Raj Mahlotra",
                            "Swaraj Khadge"
                          ],
                          abnormalitiesPercentage: 87,
                          isDownSyndromeDetected: true),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Detect down syndrome",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
