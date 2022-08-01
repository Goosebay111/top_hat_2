import 'package:flutter/material.dart';

enum LeafType {
  collection(
    buttonAlignment: AlignmentDirectional.centerEnd,
    direction: Axis.vertical,
    deleteSwipeDirection: DismissDirection.endToStart,
    saveSwipeDirection: DismissDirection.startToEnd,
  ),
  topic(
    buttonAlignment: AlignmentDirectional.centerEnd,
    direction: Axis.vertical,
    deleteSwipeDirection: DismissDirection.endToStart,
    saveSwipeDirection: DismissDirection.startToEnd,
  ),
  hatch(
    buttonAlignment: AlignmentDirectional.bottomCenter,
    direction: Axis.horizontal,
    deleteSwipeDirection: DismissDirection.up,
    saveSwipeDirection: DismissDirection.down,
  );

  const LeafType(
      {required this.buttonAlignment,
      required this.deleteSwipeDirection,
      required this.direction,
      required this.saveSwipeDirection});
  final AlignmentDirectional buttonAlignment;
  final DismissDirection deleteSwipeDirection;
  final DismissDirection saveSwipeDirection;
  final Axis direction;
}
