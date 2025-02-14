import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';



part 'hotel_image_model.freezed.dart';
part 'hotel_image_model.g.dart';

@freezed
class HotelImageModel with _$HotelImageModel {
  const factory HotelImageModel({
    @JsonKey(name: kImageLarge) required String large,
    @JsonKey(name: kImageSmall) required String small,
  }) = _HotelImageModel;

  factory HotelImageModel.fromJson(Map<String, dynamic> json) => _$HotelImageModelFromJson(json);
}

// Add the toEntity method
extension HotelImageModelX on HotelImageModel {
  HotelImage toEntity() => HotelImage(
    large: large,
    small: small,
  );
}
