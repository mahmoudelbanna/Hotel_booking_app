import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';


part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    @JsonKey(name: kOverall) required OverallModel overall,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
}

// Add the toEntity method
extension RoomModelX on RoomModel {
  Room toEntity() => Room(
    overall: overall.toEntity(), 
  );
}
