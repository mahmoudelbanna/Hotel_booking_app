import '../../../../hotel_booking_app.dart';

class HotelImageModel extends HotelImage {
  const HotelImageModel({required super.large, required super.small});

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(large: json[kImageLarge], small: json[kImageSmall]);
  }

  Map<String, dynamic> toJson() {
    return {kImageLarge: large, kImageSmall: small};
  }
}
