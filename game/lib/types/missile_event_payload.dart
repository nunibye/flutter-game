import 'package:flame/game.dart';
import 'package:game/constants/missile_enum.dart';
import 'package:game/types/event_payload.dart';

class MissileEventPayload extends EventPayload {
  final MissileData missileData;
  final Vector2 start;
  final Vector2 end;
  MissileEventPayload({
    required this.missileData,
    required this.start,
    required this.end,
  });
  @override
  Map<String, dynamic> toMapStringDynamic() => {
        "missileData": missileData.name,
        "start": start.toString(),
        "end": end.toString()
      };
}
