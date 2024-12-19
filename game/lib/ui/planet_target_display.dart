import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:game/actors/planet.dart';
import 'package:game/constants/constants.dart' as c;

class PlanetTargetDisplay extends PositionComponent {
  final List<Planet> targetPlanets;
  PlanetTargetDisplay({required this.targetPlanets});
  @override
  FutureOr<void> onLoad() {
    for (final item in targetPlanets) {
      add(PlanetTargetItem(target: item));
    }
  }
}

class PlanetTargetItem extends SpriteButtonComponent {
  final Planet target;
  PlanetTargetItem({required this.target})
      : super(anchor: Anchor.center, position: target.position, size: Vector2.all(c.planetTargetSize));
  @override
  FutureOr<void> onLoad() {}
}
