import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:game/constants/functions.dart';
import 'package:game/constants/planet_action_menu_button_enum.dart';
import 'package:game/constants/static_asset_enum.dart';
import 'package:game/rts_game.dart';
import 'package:game/constants/constants.dart' as c;

class PlanetActionMenu extends PositionComponent {
  PlanetActionMenu({required super.position});
  @override
  FutureOr<void> onLoad() {
    add(PlanetActionMenuItem(type: PlanetActionMenuButtonEnum.attack));
  }
}

class PlanetActionMenuItem extends SpriteButtonComponent
    with HasGameReference<RTSGame> {
  final PlanetActionMenuButtonEnum type;
  PlanetActionMenuItem({required this.type})
      : super(
          anchor: Anchor.center,
          size: Vector2.all(c.planetMenuItemRadius * 1.0),
        );
  @override
  FutureOr<void> onLoad() {
    button = Sprite(game.images.fromCache(type.buttonAsset.assetName));
    position =
        getCoordinatesAtAngle(Vector2.all(0), c.planetMenuRadius, type.angle);
  }
}
