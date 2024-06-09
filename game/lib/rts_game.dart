import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
// import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/actors/planet.dart';



class RTSGame extends FlameGame with ScaleDetector {
  late Planet planet;
  late double startZoom;

  @override
  Color backgroundColor() => Colors.black;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    planet = Planet(position: Vector2.all(-720 / 4));
    world.add(planet);
  }

  void clampZoom() {
    camera.viewfinder.zoom = camera.viewfinder.zoom.clamp(0.05, 3.0);
  }

  @override
  void onScaleStart(_) {
    startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    final currentScale = info.scale.global;
    if (!currentScale.isIdentity()) {
      camera.viewfinder.zoom = startZoom * currentScale.y;
      clampZoom();
    } else {
      final delta = info.delta.global;
      camera.viewport.position.translate(delta.x, delta.y);
    }
  }
}
