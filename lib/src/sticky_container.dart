import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

/// Widget to be around StickyWidgets,
///
/// StickyWidgets use the size of its parent StickyContainer as reference for positioning
class StickyContainer extends StatelessWidget {
  /// Ideally a Scrollable widget should be supplied for this parameter
  final Widget child;

  /// You can pass a list of StickyWidgets, StickyContainer does not ensures they are non-overlapping
  final List<StickyWidget> stickyChildren;

  /// true if you want to display the StickyWidgets overflowing outside of the StickyContainer's bounds.
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
