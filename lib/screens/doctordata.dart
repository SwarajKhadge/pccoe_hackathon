class Data {
  final String name;
  final String qualifications;
  final String clinic;
  final String area;
  final String imageurl;
  Data(
    this.area,
    this.clinic,
    this.name,
    this.qualifications,
    this.imageurl,
  );
}

List<Data> doctors = [
  Data("Gynacology", "Sai Clinic", "Jeet Dalal", "MD", "assets/2.jpg"),
  Data("Dermetalogy", "Aai Clinic", "Harsh Tuli", "Mk", "assets/2.jpg"),
  Data("Nutritionist", "Bai Clinic", "Swaraj Khadge", "MBBS", "assets/2.jpg"),
];
