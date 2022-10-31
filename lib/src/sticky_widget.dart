import 'package:flutter/material.dart';
import 'sticky_position.dart';

class StickyWidget extends StatefulWidget {
  final StickyPosition _initialPosition;
  final StickyPosition _finalPosition;
  final ScrollController _controller;
  final Function(double)? callback;
  final Widget child;
  StickyWidget(
      {Key? key,
      required StickyPosition initialPosition,
      required StickyPosition finalPosition,
      required ScrollController controller,
      required this.child,
      this.callback})
      : assert(
            !((initialPosition.top != null) ^ (finalPosition.top != null)) &&
                !((initialPosition.bottom != null) ^ (finalPosition.bottom != null)) &&
                !((initialPosition.left != null) ^ (finalPosition.left != null)) &&
                !((initialPosition.left != null) ^ (finalPosition.left != null)),
            "Provide same position paramters for initial and final Positions"),
        assert(
            (initialPosition.top != null) ^ (initialPosition.bottom != null) &&
                (initialPosition.left != null) ^ (initialPosition.right != null) &&
                (finalPosition.top != null) ^ (finalPosition.bottom != null) &&
                (finalPosition.left != null) ^ (finalPosition.right != null),
            "Don't provide both parameters of same axis (eg: top, bottom)"),
        _initialPosition = initialPosition,
        _finalPosition = finalPosition,
        _controller = controller,
        super(key: key);

  @override
  State<StickyWidget> createState() => _StickyWidgetState();
}

class _StickyWidgetState extends State<StickyWidget> {
  // Only 2 of these will be used, depending on which one is supplied by the user
  double? _computedTop;
  double? _computedBottom;
  double? _computedLeft;
  double? _computedRight;
  late Axis _scrollAxis;

  @override
  void initState() {
    _computedTop = widget._initialPosition.top;
    _computedBottom = widget._initialPosition.bottom;
    _computedLeft = widget._initialPosition.left;
    _computedRight = widget._initialPosition.right;
    _scrollAxis = widget._controller.position.axis;

    widget._controller.addListener(updatePosition);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener((updatePosition));
    super.dispose();
  }

  void updatePosition() {
    if (_scrollAxis == Axis.vertical) {
      if (widget._initialPosition.top != null) {
        updateTop(widget._controller.position.pixels);
      } else {
        updateBottom(widget._controller.position.pixels);
      }
    } else {
      if (widget._initialPosition.left != null) {
        updateLeft(widget._controller.position.pixels);
      } else {
        updateRight(widget._controller.position.pixels);
      }
    }
  }

  void updateTop(double scrollOffset) {
    double finalTop;
    if (widget._initialPosition.top! < widget._finalPosition.top!) {
      finalTop = widget._initialPosition.top! + scrollOffset;

      if (finalTop >= widget._initialPosition.top! && finalTop <= widget._finalPosition.top!) {
        setState(() {
          _computedTop = finalTop;
          if (widget.callback != null) widget.callback!(_computedTop!);
        });
      } else if (finalTop > widget._finalPosition.top! &&
          _computedTop! < widget._finalPosition.top!) {
        setState(() {
          _computedTop = widget._finalPosition.top!;
          if (widget.callback != null) widget.callback!(_computedTop!);
        });
      }
    } else {
      finalTop = widget._initialPosition.top! - scrollOffset;

      if (finalTop <= widget._initialPosition.top! && finalTop >= widget._finalPosition.top!) {
        setState(() {
          _computedTop = finalTop;
          if (widget.callback != null) widget.callback!(_computedTop!);
        });
      } else if (finalTop < widget._finalPosition.top! &&
          _computedTop! > widget._finalPosition.top!) {
        setState(() {
          _computedTop = widget._finalPosition.top!;
          if (widget.callback != null) widget.callback!(_computedTop!);
        });
      }
    }
  }

  void updateBottom(double scrollOffset) {
    double finalBottom;

    if (widget._initialPosition.bottom! < widget._finalPosition.bottom!) {
      finalBottom = widget._initialPosition.bottom! + scrollOffset;

      if (finalBottom >= widget._initialPosition.bottom! &&
          finalBottom <= widget._finalPosition.bottom!) {
        setState(() {
          _computedBottom = finalBottom;
          if (widget.callback != null) widget.callback!(_computedBottom!);
        });
      } else if (finalBottom > widget._finalPosition.bottom! &&
          _computedBottom! < widget._finalPosition.bottom!) {
        setState(() {
          _computedBottom = widget._finalPosition.bottom!;
          if (widget.callback != null) widget.callback!(_computedBottom!);
        });
      }
    } else {
      finalBottom = widget._initialPosition.bottom! - scrollOffset;

      if (finalBottom <= widget._initialPosition.bottom! &&
          finalBottom >= widget._finalPosition.bottom!) {
        setState(() {
          _computedBottom = finalBottom;
          if (widget.callback != null) widget.callback!(_computedBottom!);
        });
      } else if (finalBottom < widget._finalPosition.bottom! &&
          _computedBottom! > widget._finalPosition.bottom!) {
        setState(() {
          _computedBottom = widget._finalPosition.bottom!;
          if (widget.callback != null) widget.callback!(_computedBottom!);
        });
      }
    }
  }

  void updateLeft(double scrollOffset) {
    double finalLeft;
    if (widget._initialPosition.left! < widget._finalPosition.left!) {
      finalLeft = widget._initialPosition.left! + scrollOffset;

      if (finalLeft >= widget._initialPosition.left! && finalLeft <= widget._finalPosition.left!) {
        setState(() {
          _computedLeft = finalLeft;
          if (widget.callback != null) widget.callback!(_computedLeft!);
        });
      } else if (finalLeft > widget._finalPosition.left! &&
          _computedLeft! < widget._finalPosition.left!) {
        setState(() {
          _computedLeft = widget._finalPosition.left!;
          if (widget.callback != null) widget.callback!(_computedLeft!);
        });
      }
    } else {
      finalLeft = widget._initialPosition.left! - scrollOffset;

      if (finalLeft <= widget._initialPosition.left! && finalLeft >= widget._finalPosition.left!) {
        setState(() {
          _computedLeft = finalLeft;
          if (widget.callback != null) widget.callback!(_computedLeft!);
        });
      } else if (finalLeft < widget._finalPosition.left! &&
          _computedLeft! > widget._finalPosition.left!) {
        setState(() {
          _computedLeft = widget._finalPosition.left!;
          if (widget.callback != null) widget.callback!(_computedLeft!);
        });
      }
    }
  }

  void updateRight(double scrollOffset) {
    double finalRight;
    if (widget._initialPosition.right! < widget._finalPosition.right!) {
      finalRight = widget._initialPosition.right! + scrollOffset;

      if (finalRight >= widget._initialPosition.right! &&
          finalRight <= widget._finalPosition.right!) {
        setState(() {
          _computedRight = finalRight;
          if (widget.callback != null) widget.callback!(_computedRight!);
        });
      } else if (finalRight > widget._finalPosition.right! &&
          _computedRight! < widget._finalPosition.right!) {
        setState(() {
          _computedRight = widget._finalPosition.right!;
          if (widget.callback != null) widget.callback!(_computedRight!);
        });
      }
    } else {
      finalRight = widget._initialPosition.right! - scrollOffset;

      if (finalRight <= widget._initialPosition.right! &&
          finalRight >= widget._finalPosition.right!) {
        setState(() {
          _computedRight = finalRight;
          if (widget.callback != null) widget.callback!(_computedRight!);
        });
      } else if (finalRight < widget._finalPosition.right! &&
          _computedRight! > widget._finalPosition.right!) {
        setState(() {
          _computedRight = widget._finalPosition.right!;
          if (widget.callback != null) widget.callback!(_computedRight!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _computedTop,
      bottom: _computedBottom,
      left: _computedLeft,
      right: _computedRight,
      child: widget.child,
    );
  }
}
