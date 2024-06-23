import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/actors/background.dart';
import 'package:game/actors/explosion.dart';
import 'package:game/actors/missile.dart';
import 'package:game/actors/planet.dart';
import 'package:game/constants/animated_asset_enum.dart';
import 'package:game/constants/constants.dart' as c;
import 'package:game/constants/functions.dart';
import 'package:game/constants/game_event_enum.dart';
import 'package:game/constants/missile_enum.dart';
import 'package:game/constants/planet_type_enum.dart';
import 'package:game/types/event.dart';
import 'package:game/types/missile_event_payload.dart';
import 'package:game/ui/circular_range_indicator.dart';

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
          fontSize: 24,
          fontFamily: 'Minecraft',
        ),
      ),
    );

    planetA =
        Planet(position: Vector2(-200, 0), planetType: PlanetType.friendly);
    planetB = Planet(position: Vector2(200, 0), planetType: PlanetType.enemy);
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
        final payload = (event.payload as MissileEventPayload);
        final missile = Missile(missileData: payload.missileData);
        missile.position = payload.start;
        missile.angle = getAngle(payload.start, payload.end);
        world.add(missile
          ..add(MoveToEffect(
            payload.end,
            EffectController(
              duration: getTime(
                  payload.start, payload.end, payload.missileData.speed),
            ),
            onComplete: () {
              world.remove(missile);
              world.add(Explosion(position: payload.end));
            },
          )));
        return;
    }
  }
}
