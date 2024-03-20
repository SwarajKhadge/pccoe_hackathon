import 'package:flutter/material.dart';

class DownSyndromeReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Down Syndrome Detection Report'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Patient Information'),
              SizedBox(height: 8.0),
              _buildCustomText('Name', 'John Doe'),
              _buildCustomText('Age', '30'),
              _buildCustomText('Gender', 'Male'),
              _buildCustomText('Weight', '70 kg'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Test Performed'),
              SizedBox(height: 8.0),
              _buildInfoText('First Trimester Combined Screening'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Ultrasound Image(s)'),
              SizedBox(height: 8.0),
              // Placeholder for ultrasound images
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text('Ultrasound Image(s)'),
                ),
              ),
              SizedBox(height: 20.0),
              _buildSectionTitle('Findings of the Test'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  '- Nuchal Translucency (NT) measurement: Increased'),
              _buildInfoText('- Absent nasal bone: Present'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Risk Level'),
              SizedBox(height: 8.0),
              _buildCustomText('Risk Level', 'High'),
              SizedBox(height: 4.0),
              _buildInfoText(
                  'Comments: The patient has multiple markers associated with Down syndrome.'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Symptoms'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  '-  Enlargement of the lateral ventricles in the fetal brain'),
              _buildInfoText(
                  '- Underdevelopment or smaller size of the cerebellum'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Further Advice'),
              SizedBox(height: 8.0),
              _buildInfoText(
                  'Consult with a genetic counselor for further evaluation.'),
              SizedBox(height: 20.0),
              _buildSectionTitle('Conclusion of Report'),
              SizedBox(height: 8.0),
              _buildCustomText('Conclusion', 'Down Syndrome Detected'),
              SizedBox(height: 4.0),
              _buildInfoText(
                  'Probabilities: The patient has a high likelihood of having a baby with Down syndrome.'),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 150,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.health_and_safety),
              Text(
                "Ask Community",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildCustomText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }
}
