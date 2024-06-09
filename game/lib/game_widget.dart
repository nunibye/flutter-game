import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/rts_game.dart';

class RootGameWidget extends StatelessWidget {
  const RootGameWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GameWidget<RTSGame>(game: RTSGame());
  }
}

//viewportResolution: Vector2(720, 720)
