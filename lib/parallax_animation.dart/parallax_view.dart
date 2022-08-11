import 'package:flutter/material.dart';

import '../model/dummy_data.dart';

class ParallaxView extends StatefulWidget {
  const ParallaxView({Key? key}) : super(key: key);

  @override
  ParallaxViewState createState() => ParallaxViewState();
}

class ParallaxViewState extends State<ParallaxView> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: decoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: vanGoghInformationTexts(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: pageViewCaption(),
                ),
                Container(
                  height: 400,
                  padding: const EdgeInsets.only(bottom: 30),
                  child: buildPageView(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/background.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  Column vanGoghInformationTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 30),
        Text(
          'Vincent\nvan Gogh',
          style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              letterSpacing: 2,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '30 March 1853-29 July 1890',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Vincent Willem van Gogh was a Dutch post-impressionist painter who posthumously became one of the most famous and influential figures in the history of Western art.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Text pageViewCaption() {
    return const Text(
      'Highlight Paintings',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildPageView() {
    return PageView.builder(
      itemCount: paintingMap.length,
      controller: pageController,
      itemBuilder: (context, i) {
        return Transform.scale(
          scale: 1,
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    paintingMap[i]['image'],
                    height: 370,
                    fit: BoxFit.cover,
                    alignment: Alignment(-pageOffset.abs() + i, 0),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  right: 10,
                  child: Text(
                    paintingMap[i]['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
