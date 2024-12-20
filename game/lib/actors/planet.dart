import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:game/constants/animated_asset_enum.dart';
import 'package:game/constants/functions.dart';
import 'package:game/constants/planet_type_enum.dart';
import 'package:game/rts_game.dart';
import 'package:game/constants/constants.dart' as c;

class Planet extends SpriteAnimationComponent
    with HasGameReference<RTSGame>, TapCallbacks {
  final PlanetType planetType;
  int id;
  Planet({required super.position, required this.planetType, this.id = 0})
      : super(size: Vector2.all(c.planetSize), anchor: Anchor.center);

  AnimatedAssetEnum chooseAsset() {
    switch (planetType) {
      case PlanetType.friendly:
        return getRandomItemFromList([
          AnimatedAssetEnum.friendlyPlanet1,
          AnimatedAssetEnum.friendlyPlanet2,
          AnimatedAssetEnum.friendlyPlanet3
        ]);
      case PlanetType.enemy:
        return getRandomItemFromList([
          AnimatedAssetEnum.enemyPlanet1,
          AnimatedAssetEnum.enemyPlanet2,
          AnimatedAssetEnum.enemyPlanet3
        ]);
      case PlanetType.none:
        return getRandomItemFromList([
          AnimatedAssetEnum.emptyPlanet1,
          AnimatedAssetEnum.emptyPlanet2,
        ]);
      case PlanetType.dead:
        return AnimatedAssetEnum.deadPlanet1;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final assetData = chooseAsset();
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
    if (planetType == PlanetType.friendly) {
      game.openPlanetMenu(id);
    }

    // game.world.add(PlanetActionMenu(position: position));
    // game.addEvent(Event(
    //     type: GameEvent.missileLaunch,
    //     payload: MissileEventPayload(
    //         missileData: MissileData.white,
    //         start: position,
    //         end: Vector2.all(100))));
  }
}
