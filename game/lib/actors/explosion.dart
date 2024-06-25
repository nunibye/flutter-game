import 'package:flame/components.dart';
import 'package:game/constants/animated_asset_enum.dart';
import 'package:game/rts_game.dart';

class Explosion extends SpriteAnimationComponent
    with HasGameReference<RTSGame> {
  Explosion({
    super.position,
  }) : super(
          size: Vector2.all(50),
          anchor: Anchor.center,
          removeOnFinish: true,
        );
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache(AnimatedAssetEnum.explosion.assetName),
      SpriteAnimationData.sequenced(
        amount: AnimatedAssetEnum.explosion.frameCount,
        stepTime: AnimatedAssetEnum.explosion.stepTime,
        textureSize: AnimatedAssetEnum.explosion.textureSize,
        loop: false,
      ),
    );
  }
}
