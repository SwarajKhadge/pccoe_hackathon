class Data {
  final String name;
  final String url;
  final String description;
  Data(
    this.name,
    this.url,
    this.description,
  );
}

List<Data> datalist = [
  Data("Heath Check", "images/health check.jpg",
      "Keep track of your child's health record"),
  Data("Community", "images/doc.jpg",
      "Any doubts ! An entire community of doctors is available to help !!"),
  Data("Latest Updates !", "images/news.png",
      "Stay updated with any news that might be of concern for your child !")
];
