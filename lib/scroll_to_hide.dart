import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideToScrollTab extends StatefulWidget {
  const HideToScrollTab(
      {@required this.child, @required this.controller, this.onScroll});

  final Widget child;
  final ScrollController controller;
  final ValueChanged<bool> onScroll;

  @override
  _HideToScrollTabState createState() => _HideToScrollTabState();
}

class _HideToScrollTabState extends State<HideToScrollTab> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(scrollListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    final ScrollDirection direction =
        widget.controller.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    widget.onScroll(true);
  }

  void hide() {
    widget.onScroll(false);
  }

  @override
  Widget build(BuildContext context) => Container(
    child: widget.child,
  );
}
