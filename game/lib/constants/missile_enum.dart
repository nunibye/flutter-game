import 'package:flame/game.dart';
import 'package:game/constants/static_asset_enum.dart';

enum MissileData {
  //diffrent missiles
  white(asset: StaticAssetEnum.whiteMissile, speed: 150);

  //type returned
  final int speed;
  final StaticAssetEnum asset;
  const MissileData({
    required this.asset,
    required this.speed,
  });
  //getter since Vector2 is non-const
  Vector2 get size {
    switch (this) {
      case MissileData.white:
        return Vector2(16, 24);
    }
  }
}
