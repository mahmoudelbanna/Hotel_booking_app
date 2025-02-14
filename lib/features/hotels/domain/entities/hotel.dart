import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'hotel.freezed.dart';

@freezed
class Hotel with _$Hotel {
  // ignore: unused_element
  const Hotel._();
  const factory Hotel({
    required String id,
    required String name,
    required String destination,
    required int category,
    required String categoryType,
    required List<HotelImage> images,
    required BestOffer bestOffer,
    required RatingInfo ratingInfo,
  }) = _Hotel;

  factory Hotel.empty() => Hotel(
    id: '',
    name: '',
    destination: '',
    category: 0,
    categoryType: '',
    images: [],
    bestOffer: BestOffer.empty(),
    ratingInfo: RatingInfo.empty(),
  );

  // Add toMap method
  Map<String, dynamic> toMap() {
    return {
      kHotelId: id,
      kHotelName: name,
      kDestination: destination,
      kCategory: category,
      kCategoryType: categoryType,
      kImages: images.map((image) => image.toMap()).toList(), // Assuming HotelImage has a toMap method
      kBestOffer: bestOffer.toMap(), // Assuming BestOffer has a toMap method
      kRatingInfo: ratingInfo.toMap(), // Assuming RatingInfo has a toMap method
    };
  }
}
