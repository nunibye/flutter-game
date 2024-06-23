import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CircularRangeIndicator extends CircleComponent {
  // final double radius;
  // final Vector2 position;
  CircularRangeIndicator({super.position, super.radius})
      : super(
            anchor: Anchor.center,
            paint: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.white);
}
