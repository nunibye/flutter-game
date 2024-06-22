import 'package:game/constants/game_event_enum.dart';
import 'package:game/types/event_payload.dart';
import 'package:game/types/missile_event_payload.dart';

class Event {
  final GameEvent type;
  final EventPayload payload;
  Event({required this.type, required this.payload})
      : assert(
            type != GameEvent.missileLaunch || payload is MissileEventPayload);
  static Map<String, dynamic> toJson(Event value) =>
      {"type": value.type.name, "payload": value.payload.toMapStringDynamic()};
}
