import '../../../../hotel_booking_app.dart';

class RoomModel extends Room {
  const RoomModel({
    required super.boarding,
    required super.type,
    required super.adultCount,
    required super.childrenCount,
    required super.travelDate,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      boarding: json[kBoarding],
      type: json[kBestOfferName],
      adultCount: json[kAdultCount],
      childrenCount: json[kChildrenCount],
      travelDate: TravelDateModel.fromJson(json[kTravelDate]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kBoarding: boarding,
      kBestOfferName: type,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
      kTravelDate: travelDate.toMap(),
    };
  }
}
