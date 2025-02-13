import '../../../../hotel_booking_app.dart';

class RoomModel extends Room {
  const RoomModel({required super.overall});

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(overall: OverallModel.fromJson(json[kOverall]));
  }

  Map<String, dynamic> toJson() {
    return {kOverall: overall.toMap()};
  }
}
