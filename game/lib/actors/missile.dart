import 'dart:async';

import 'package:flame/components.dart';
import 'package:game/constants/missile_enum.dart';
import 'package:game/rts_game.dart';

class Missile extends SpriteComponent with HasGameReference<RTSGame>{
  final MissileData missileData;
  Missile({
    required this.missileData,
  }) : super(size: missileData.size);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache(missileData.assetName));
  }
}
