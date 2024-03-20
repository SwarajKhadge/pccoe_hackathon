import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/carousel/data.dart';

class Causcreen extends StatefulWidget {
  const Causcreen({super.key});

  @override
  State<Causcreen> createState() => _CauscreenState();
}

class _CauscreenState extends State<Causcreen> {
  late PageController _pageController;
  final int _currentpage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: _currentpage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Healthcare !"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.89,
            child: PageView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: datalist.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index, _currentpage);
                }),
          ),
          const SizedBox(
            height: 70,
          ),
          signIn(),
          const SizedBox(height: 25),
          signUp(),
        ],
      ),
    );
  }
}

Widget carouselView(int index, currentPage) {
  return carousel(datalist[index], currentPage);
}

Widget carousel(Data data, int currentPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(
            data.url,
            fit: BoxFit.fill,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(data.name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 230,
          child: Text(
            data.description,
            style: const TextStyle(
                color: Colors.black45, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}

Widget _buildIndicator(currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      3, // Replace with your total number of pages
      (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      },
    ),
  );
}

Widget signIn() {
  return Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    child: const Center(
      child: Text("Sign in",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
    ),
  );
}

Widget signUp() {
  return Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.blue),
    ),
    child: const Center(
      child: Text("Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue)),
    ),
  );
}
