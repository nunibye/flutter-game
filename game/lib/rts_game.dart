import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/actors/background.dart';
import 'package:game/actors/planet.dart';

class RTSGame extends FlameGame with ScaleDetector {
  //planet for testing mainly
  late Planet planetA;
  late Planet planetB;
  late TextComponent _playerScore;

  final allowedCameraArea = Vector2(10000, 10000);
  //Set background color
  @override
  Color backgroundColor() => Colors.black;

  @override
  Future<void> onLoad() async {
    //load all images
    await images.loadAll(['3824724667_terran_wet.png', 'background.png']);

    //create background
    final background = StarsBackground()..anchor = Anchor.center;

    //restrict camera movement
    camera.setBounds(
      Rectangle.fromCenter(
        center: Vector2.zero(),
        size: allowedCameraArea,
      ),
    );

    // Create text component for player score. example. move to file in practice
    _playerScore = TextComponent(
      text: 'Score: 0',
      position: Vector2(10, 10),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );

    planetA = Planet(position: Vector2.all(0));
    planetB = Planet(position: Vector2(400, 300));
    //add HUD elements
    await camera.viewport.add(_playerScore);
    //add game elements
    await world.addAll([background, planetA, planetB]);
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    //move camera on drag
    final currentScale = info.scale.global;
    if (!currentScale.isIdentity()) {
      final delta = info.delta.global;
      camera.moveBy(-delta);
    }
  }
}
