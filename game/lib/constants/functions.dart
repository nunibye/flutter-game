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

dynamic getRandomItemFromList(List<dynamic> list) {
  Random random = Random();
  int index = random.nextInt(list.length);
  return list[index];
}

//returns the coordinates that represnt a point lying on the circle centered at center, with radius radius at an anlge in radians
Vector2 getCoordinatesAtAngle(Vector2 center, int radius, double angle) {
  return Vector2(center.x + radius * cos(angle), center.y + radius * sin(angle) * -1);
}
