import '../../../../hotel_booking_app.dart';

class TravelDateModel extends TravelDate {
  const TravelDateModel({required super.days, required super.nights});

  factory TravelDateModel.fromJson(Map<String, dynamic> json) {
    return TravelDateModel(days: json[kDays], nights: json[kNights]);
  }

  Map<String, dynamic> toJson() {
    return {kDays: days, kNights: nights};
  }
}
