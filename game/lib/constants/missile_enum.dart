import 'package:flame/game.dart';

enum MissileData {
  //diffrent missiles
  white(assetName: "white_missile.png"),
  pink(assetName: "pink_missile.png"),
  gray(assetName: "gray_missile.png");

  //type returned
  final String assetName;
  const MissileData({
    required this.assetName,
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
