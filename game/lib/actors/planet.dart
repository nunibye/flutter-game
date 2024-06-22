import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:game/actors/missile.dart';
import 'package:game/constants/animated_asset_enum.dart';
import 'package:game/constants/game_event_enum.dart';
import 'package:game/constants/missile_enum.dart';
import 'package:game/rts_game.dart';
import 'package:game/types/event.dart';
import 'package:game/types/missile_event_payload.dart';

class Planet extends SpriteAnimationComponent
    with HasGameReference<RTSGame>, TapCallbacks {
  final AnimatedAsset assetData;
  Planet({required super.position, required this.assetData})
      : super(size: Vector2.all(50), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(assetData.assetName),
      SpriteAnimationData.sequenced(
        amount: assetData.frameCount,
        stepTime: assetData.stepTime,
        textureSize: assetData.textureSize,
      ),
    );
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    game.addEvent(Event(
        type: GameEvent.missileLaunch,
        payload: MissileEventPayload(
            missileData: MissileData.white,
            start: position,
            end: Vector2.all(100))));
  }
}
