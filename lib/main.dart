import 'package:flutter/material.dart';
import 'package:parallax_animation/folding_animation.dart/folding_view.dart';
import 'package:parallax_animation/parallax_animation.dart/parallax_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const ParallaxView());
  }
}
