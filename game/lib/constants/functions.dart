import 'dart:math';

import 'package:flame/game.dart';

//returns angle in radians between two points
double getAngle(Vector2 p1, Vector2 p2) {
  final dx = p2.x - p1.x;
  final dy = p2.y - p1.y;
  double angle = atan2(dx, -dy);
  return angle;
}

//returns time to travel from one point to another
double getTime(Vector2 p1, Vector2 p2, int speed) {
  return p1.distanceTo(p2) / speed;
}
