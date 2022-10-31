import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

/// Widget to be around StickyWidgets,
///
/// StickyWidgets use the size of its parent StickyContainer as reference for positioning
class StickyContainer extends StatelessWidget {
  final Widget child;
  final List<StickyWidget> stickyChildren;
  final bool displayOverFlowContent;
  const StickyContainer(
      {Key? key,
      required this.child,
      required this.stickyChildren,
      this.displayOverFlowContent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        ...stickyChildren,
      ],
    );
  }
}
