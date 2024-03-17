import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  final String advise;
  final List<String> reasons;
  final String diagnosis;
  final List<String> doctors;
  final double abnormalitiesPercentage;
  final bool isDownSyndromeDetected;

  ResultScreen({
    required this.advise,
    required this.reasons,
    required this.diagnosis,
    required this.doctors,
    required this.abnormalitiesPercentage,
    required this.isDownSyndromeDetected,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Down Syndrome Detection Result'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animation,
              child: _buildDetectionResult(),
            ),
            SizedBox(height: 16.0),
            FadeTransition(
              opacity: _animation,
              child: _buildPercentage(),
            ),
            SizedBox(height: 24.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.5),
                end: Offset.zero,
              ).animate(_animation),
              child: _buildContainer('Advise:', widget.advise),
            ),
            SizedBox(height: 16.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.5),
                end: Offset.zero,
              ).animate(_animation),
              child: _buildContainer(
                'Reasons for Syndrome:',
                widget.reasons.join('\n'),
              ),
            ),
            SizedBox(height: 16.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.5),
                end: Offset.zero,
              ).animate(_animation),
              child: _buildContainer('Diagnosis:', widget.diagnosis),
            ),
            SizedBox(height: 16.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.5),
                end: Offset.zero,
              ).animate(_animation),
              child: _buildDoctors(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetectionResult() {
    Color resultColor =
        widget.isDownSyndromeDetected ? Colors.red : Colors.green;

    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          children: [
            Text(
              widget.isDownSyndromeDetected
                  ? 'Down Syndrome Detected'
                  : 'Down Syndrome Not Detected',
              style: GoogleFonts.barlow(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: resultColor,
              ),
            ),
            SizedBox(height: 8.0),
            Divider(
              color: resultColor,
              thickness: 2.0,
              indent: 50.0,
              endIndent: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentage() {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Text(
          'Abnormalities Percentage: ${widget.abnormalitiesPercentage.toStringAsFixed(2)}%',
          style: GoogleFonts.barlow(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(String title, String content) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.barlow(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: GoogleFonts.barlow(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctors() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Consult Doctors:',
            style: GoogleFonts.barlow(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.0),
          SizedBox(
            height: 100.0,
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.doctors.length,
                itemBuilder: (context, index) {
                  var doctor = widget.doctors[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/$doctor.jpg'),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          doctor,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResultScreen(
      advise: 'Seek medical advice for further evaluation and management.',
      reasons: [
        'Extra genetic material from chromosome 21.',
        'Maternal age over 35.',
        'Family history of Down syndrome.'
      ],
      diagnosis:
          'Down syndrome is diagnosed through prenatal screening tests and diagnostic tests such as amniocentesis or chorionic villus sampling (CVS).',
      doctors: [
        'doctor1',
        'doctor2',
        'doctor3'
      ], // Change with actual image names
      abnormalitiesPercentage: 12.5,
      isDownSyndromeDetected: true,
    ),
  ));
}
