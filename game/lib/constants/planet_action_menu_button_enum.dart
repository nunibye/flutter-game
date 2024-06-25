import 'dart:math';

import 'package:game/constants/static_asset_enum.dart';

enum PlanetActionMenuButtonEnum {
  attack(angle: pi / 4 * 3, buttonAsset: StaticAssetEnum.attackButton);

  final StaticAssetEnum buttonAsset;
  final double angle;
  const PlanetActionMenuButtonEnum(
      {required this.angle, required this.buttonAsset});
}
