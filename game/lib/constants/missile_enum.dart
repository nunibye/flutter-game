import 'package:flame/game.dart';

enum MissileData {
  //diffrent missiles
  white(assetName: "white_missile.png", speed: 150),
  pink(assetName: "pink_missile.png", speed: 10),
  gray(assetName: "gray_missile.png", speed: 10);

  //type returned
  final String assetName;
  final int speed;
  const MissileData({
    required this.assetName,
    required this.speed,
  });
  //getter since Vector2 is non-const
  Vector2 get size {
    switch (this) {
      case MissileData.pink:
        return Vector2.all(100);
      case MissileData.gray:
        return Vector2.all(100);
      case MissileData.white:
        return Vector2(16, 24);
    }
  }
}
