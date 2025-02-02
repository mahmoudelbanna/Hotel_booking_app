import '../../../../hotel_booking_app.dart';

class OverallModel extends Overall {
  const OverallModel({
    required super.boarding,
    required super.roomsOverallName,
    required super.adultCount,
    required super.childrenCount,
  });

  factory OverallModel.fromJson(Map<String, dynamic> json) {
    return OverallModel(
      boarding: json[kBoarding],
      roomsOverallName: json[kRoomsOverallName],
      adultCount: json[kAdultCount],
      childrenCount: json[kChildrenCount],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kBoarding: boarding,
      kRoomsOverallName: kRoomsOverallName,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
    };
  }
}
