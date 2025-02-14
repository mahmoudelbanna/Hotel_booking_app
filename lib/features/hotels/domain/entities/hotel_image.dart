import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

part 'hotel_image.freezed.dart';

@freezed
class HotelImage with _$HotelImage {
  // ignore: unused_element
  const HotelImage._();
  const factory HotelImage({required String large, required String small}) =
      _HotelImage;

  // Add toMap method
  Map<String, dynamic> toMap() {
    return {
      kImageLarge: large,
      kImageSmall: small,
    };
  }
}
