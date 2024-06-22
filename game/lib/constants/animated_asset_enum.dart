import 'package:flame/game.dart';

enum AnimatedAsset {
  //list of textures
  terra(assetName: '3824724667_terran_wet.png', stepTime: 0.2, frameCount: 50);

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
      case AnimatedAsset.terra:
        return Vector2.all(100);
    }
  }
}
