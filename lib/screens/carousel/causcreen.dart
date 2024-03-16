import 'package:flutter/material.dart';
import 'package:pccoe_hackathon/screens/carousel/data.dart';

class Causcreen extends StatefulWidget {
  @override
  State<Causcreen> createState() => _CauscreenState();
}

class _CauscreenState extends State<Causcreen> {
  late PageController _pageController;
  int _currentpage = 0;
  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentpage, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Healthcare !"),
      ),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: AspectRatio(
          aspectRatio: 0.85,
          child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: datalist.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(index);
              }),
        ),
      ),
    );
  }
}

Widget carouselView(int index) {
  return carousel(datalist[index]);
}

Widget carousel(Data data) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
