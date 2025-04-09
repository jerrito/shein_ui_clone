import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';

class PersistentAppBar extends SliverPersistentHeaderDelegate {
  final bool showAlternative;
  final BuildContext context;
  final Widget mainWidget, collapsedWidget;

  PersistentAppBar({
    required this.mainWidget,
    required this.collapsedWidget,
    required this.context,
    required this.showAlternative,
  });

  @override
  double get maxExtent => Sizes.height(context, 0.4);

  @override
  double get minExtent => Sizes.height(context, 0.1);

  @override
  bool shouldRebuild(PersistentAppBar oldDelegate) {
    return oldDelegate.showAlternative != showAlternative;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: showAlternative ? mainWidget : collapsedWidget,
      ),
    );
  }
}
