import 'package:flame/game.dart';

enum AnimatedAsset {
  //list of textures
  friendlyPlanet1(assetName: 'friendly1.png', stepTime: 0.2, frameCount: 50),
  friendlyPlanet2(assetName: 'friendly2.png', stepTime: 0.2, frameCount: 50),
  friendlyPlanet3(assetName: 'friendly3.png', stepTime: 0.2, frameCount: 50),
  enemyPlanet1(assetName: 'enemy1.png', stepTime: 0.2, frameCount: 50),
  enemyPlanet2(assetName: 'enemy2.png', stepTime: 0.2, frameCount: 50),
  enemyPlanet3(assetName: 'enemy3.png', stepTime: 0.2, frameCount: 50),
  emptyPlanet1(assetName: 'none1.png', stepTime: 0.2, frameCount: 50),
  emptyPlanet2(assetName: 'none2.png', stepTime: 0.2, frameCount: 50),
  deadPlanet1(assetName: 'dead1.png', stepTime: 0.2, frameCount: 50),
  explosion(assetName: 'explosion.png', stepTime: 0.1, frameCount: 8);

//type returned by enum
  final String assetName;
  final int frameCount;
  final double stepTime;
  const AnimatedAsset(
      {required this.assetName,
      required this.frameCount,
      required this.stepTime});

//getter since Vector2 is non const
  Vector2 get textureSize {
    switch (this) {
      case AnimatedAsset.explosion:
        return Vector2.all(32);
      default:
        return Vector2.all(100);
    }
  }
}
