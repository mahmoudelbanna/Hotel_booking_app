import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'hotel_model.freezed.dart';
part 'hotel_model.g.dart';

@freezed
class HotelModel with _$HotelModel, EntityConvertible<HotelModel, Hotel> {
  // ignore: unused_element
  const HotelModel._();
  const factory HotelModel({
    @JsonKey(name: kHotelId) required String id,
    @JsonKey(name: kHotelName) required String name,
    @JsonKey(name: kDestination) required String destination,
    @JsonKey(name: kCategory) required int category,
    @JsonKey(name: kCategoryType) required String categoryType,
    @JsonKey(name: kImages) required List<HotelImageModel> images,
    @JsonKey(name: kBestOffer) required BestOfferModel bestOffer,
    @JsonKey(name: kRatingInfo) required RatingInfoModel ratingInfo,
  }) = _HotelModel;

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  @override
  Hotel toEntity() => Hotel(
    id: id,
    name: name,
    destination: destination,
    category: category,
    categoryType: categoryType,
    images: images.map((image) => image.toEntity()).toList(),
    bestOffer: bestOffer.toEntity(),
    ratingInfo: ratingInfo.toEntity(),
  );
}
