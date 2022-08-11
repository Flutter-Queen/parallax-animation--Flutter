import 'package:flutter/material.dart';

import '../model/dummy_data.dart';
import 'pageview_item.dart';

class FoldingView extends StatefulWidget {
  const FoldingView({Key? key}) : super(key: key);

  @override
  State<FoldingView> createState() => _FoldingViewState();
}

class _FoldingViewState extends State<FoldingView> {
  /// The current page of the page view
  double _page = 0;

  /// The index of the leftmost element of the list to be displayed
  int get _firstItemIndex => _page.toInt();

  /// Controller to get the current position of the page view
  final _controller = PageController(viewportFraction: 0.5);

  /// The width of a single item
  late final _itemWidth =
      MediaQuery.of(context).size.width * _controller.viewportFraction;

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () => setState(() => _page = _controller.page!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: _itemWidth,
                    child: FractionallySizedBox(
                      child: pageViewItem(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: buildPageView(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Parallax Animation"),
    );
  }

  PageViewItem pageViewItem() {
    return PageViewItem(
      index: _firstItemIndex,
      width: _itemWidth,
      iamgePath: paintingList[_firstItemIndex],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      padEnds: false,
      controller: _controller,
      itemBuilder: (context, index) {
        return Opacity(
          opacity: index <= _firstItemIndex ? 0 : 1,
          child: PageViewItem(
            index: index,
            width: _itemWidth,
            iamgePath: paintingList[index],
          ),
        );
      },
      itemCount: paintingList.length,
    );
  }
}
