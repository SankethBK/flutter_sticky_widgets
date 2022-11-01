/// Custom position class used to indicate initial and final positions of StickyWidget
///
/// Don't pass all 4 parameters, as StickyContainer can't guess the size of child widget,
/// instead pass only 2 parameters (top/bottom, up/down)
class StickyPosition {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  StickyPosition({this.top, this.bottom, this.left, this.right});
}
