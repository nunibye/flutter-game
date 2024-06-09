import 'package:flame/components.dart';
import 'package:game/rts_game.dart';

class Planet extends SpriteAnimationComponent with HasGameReference<RTSGame> {
  Planet({
    required super.position,
  }) : super(size: Vector2.all(200), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      '3824724667_terran_wet.png',
      SpriteAnimationData.sequenced(
        amount: 50,
        stepTime: .2,
        textureSize: Vector2(100, 100),
      ),
    );
  }
}