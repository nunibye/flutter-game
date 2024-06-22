import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/actors/background.dart';
import 'package:game/actors/planet.dart';
import 'package:game/constants/animated_asset_enum.dart';
import 'package:game/constants/constants.dart' as c;
import 'package:game/constants/game_event_enum.dart';
import 'package:game/types/event.dart';

class RTSGame extends FlameGame with ScaleDetector {
  //planet for testing mainly
  late Planet planetA;
  late Planet planetB;
  late TextComponent _playerScore;
  //events that will happen this cycle
  final _currentCommandList = List<Event>.empty(growable: true);
  //events that will happen next cycle
  final _nextCommandList = List<Event>.empty(growable: true);
  final allowedCameraArea = Vector2(100, 400);
  //Set background color
  @override
  Color backgroundColor() => Colors.black;

  @override
  Future<void> onLoad() async {
    //load all images
    await images.loadAll(c.imageAssets);

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

    planetA =
        Planet(position: Vector2(-200, 0), assetData: AnimatedAsset.terra);
    planetB = Planet(position: Vector2(200, 0), assetData: AnimatedAsset.terra);
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

  @override
  void update(double dt) {
    super.update(dt);
    _currentCommandList.forEach(processEvent);
    _currentCommandList.clear();
    _currentCommandList.addAll(_nextCommandList);
    _nextCommandList.clear();
  }

  void addEvent(Event e) {
    _nextCommandList.add(e);
  }

  void processEvent(Event event) {
    switch (event.type) {
      case GameEvent.none:
        return;
      case GameEvent.missileLaunch:
        print("launch");
        return;
    }
  }
}
