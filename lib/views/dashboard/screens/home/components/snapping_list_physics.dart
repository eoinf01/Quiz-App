import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class HorizontalSnappingList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double itemWidth;
  final double itemHorizontalMargin;
  final double listHeight;
  final double itemsConsumedWidth;

  HorizontalSnappingList({
    required this.itemBuilder,
    required this.itemCount,
    this.itemWidth = 250.0,
    this.itemHorizontalMargin = 8.0,
    this.listHeight = 250.0,
  }) : itemsConsumedWidth = itemWidth + (itemHorizontalMargin * 2);

  @override
  _HorizontalSnappingListState createState() => _HorizontalSnappingListState();
}

class _HorizontalSnappingListState extends State<HorizontalSnappingList> {
  late ScrollController _scrollController;
  double scrollOffset = 0;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.position.pixels / 200;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.listHeight,
      child: ListView.builder(
        clipBehavior: Clip.none,
        physics: SnappingListScrollPhysics(itemExtent: 200),
        padding: EdgeInsets.only(left: 30,top: 5,bottom: 5),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, i) {
          double scale = ((1 - math.min((i - scrollOffset).abs(), 1.0)) * (1 - 0.85)) + 0.850;
          return Transform.scale(
            scale: scale,
            child: widget.itemBuilder(context, i),
          );
        },
      ),
    );
  }
}

class SnappingListScrollPhysics extends ScrollPhysics {
  final double mainAxisStartPadding;
  final double itemExtent;

  const SnappingListScrollPhysics(
      {ScrollPhysics? parent,
        this.mainAxisStartPadding = 0.0,
        required this.itemExtent})
      : super(parent: parent);

  @override
  SnappingListScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnappingListScrollPhysics(
        parent: buildParent(ancestor),
        mainAxisStartPadding: mainAxisStartPadding,
        itemExtent: itemExtent);
  }

  double _getItem(ScrollMetrics position) {
    return (position.pixels - mainAxisStartPadding) / itemExtent;
  }

  double _getPixels(ScrollMetrics position, double item) {
    return min(item * itemExtent, position.maxScrollExtent);
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double item = _getItem(position);
    if (velocity < -tolerance.velocity)
      item -= 0.5;
    else if (velocity > tolerance.velocity) item += 0.5;
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}