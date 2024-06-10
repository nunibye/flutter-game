import 'package:flame/components.dart';
import 'package:game/rts_game.dart';

class StarsBackground extends SpriteComponent with HasGameReference<RTSGame> {
  static const backgroundSize = 800.0;
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("background.png"));
    // *3 because background.png is pre-tiled to a 3 by 3
    size = Vector2.all(backgroundSize * 3);
    position = Vector2.zero();
    anchor = Anchor.center;
  }

  void adjustBackgroundPosition() {
    const halfWidth = backgroundSize / 2;
    final cameraPos = game.camera.viewfinder.position;

    // Check if the point is outside the square's bounds
    if (cameraPos.x < position.x - halfWidth ||
        cameraPos.x > position.x + halfWidth ||
        cameraPos.y < position.y - halfWidth ||
        cameraPos.y > position.y + halfWidth) {
      // Move the background to the right or left
      if (cameraPos.x < position.x - halfWidth) {
        position.x -= backgroundSize;
      } else if (cameraPos.x > position.x + halfWidth) {
        position.x += backgroundSize;
      }

      // Move the background up or down
      if (cameraPos.y < position.y - halfWidth) {
        position.y -= backgroundSize;
      } else if (cameraPos.y > position.y + halfWidth) {
        position.y += backgroundSize;
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    //based on camera movement move the background to create illusion of infinite background
    adjustBackgroundPosition();
  }
}
