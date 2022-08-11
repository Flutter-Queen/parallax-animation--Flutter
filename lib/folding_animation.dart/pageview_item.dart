import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final int index;
  final String iamgePath;
  final double width;

  const PageViewItem({
    Key? key,
    required this.index,
    required this.width,
    required this.iamgePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: decoration(),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(13.0),
      ),
      image: DecorationImage(
        image: AssetImage(iamgePath),
        fit: BoxFit.fill,
      ),
    );
  }
}
