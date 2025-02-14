import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'room.freezed.dart';


@freezed
class Room with _$Room {
  // ignore: unused_element
  const Room._();
  const factory Room({
    required Overall overall,
  }) = _Room;

  factory Room.empty() => Room(overall: Overall.empty());

  Map<String, dynamic> toMap() {
    return {
      kOverall: overall.toMap(),
    };
  }
}
