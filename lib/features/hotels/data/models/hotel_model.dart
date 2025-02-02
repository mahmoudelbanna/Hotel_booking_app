import '../../../../hotel_booking_app.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required super.id,
    required super.name,
    required super.destination,
    required super.category,
    required super.categoryType,
    required super.images,
    required super.bestOffer,
    required super.ratingInfo,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json[kId],
      name: json[kHotelName],
      destination: json[kDestination],
      category: json[kCategory],
      categoryType: json[kCategoryType],
      images: (json[kImages] as List)
          .map((image) => HotelImageModel.fromJson(image))
          .toList(),
      bestOffer: BestOfferModel.fromJson(json[kBestOffer]),
      ratingInfo: RatingInfoModel.fromJson(json[kRatingInfo]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kId: id,
      kHotelName: name,
      kDestination: destination,
      kCategory: category,
      kCategoryType: categoryType,
      kImages: images.map((image) => image.toMap()).toList(),
      kBestOffer: bestOffer.toMap(),
      kRatingInfo: ratingInfo.toMap(),
    };
  }
}
