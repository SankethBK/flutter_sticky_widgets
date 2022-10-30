import 'package:flutter/material.dart';

class StickyContainer extends StatelessWidget {
  final Widget child;
  final List<Widget> stickyChildren;
  const StickyContainer(
      {Key? key, required this.child, required this.stickyChildren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ...stickyChildren,
      ],
    );
  }
}
