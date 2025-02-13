import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class Hotel extends Equatable {
  final String id;
  final String name;
  final String destination;
  final int category;
  final String categoryType;
  final List<HotelImage> images;
  final BestOffer bestOffer;
  final RatingInfo ratingInfo;

  const Hotel({
    required this.id,
    required this.name,
    required this.destination,
    required this.category,
    required this.categoryType,
    required this.images,
    required this.bestOffer,
    required this.ratingInfo,
  });

  factory Hotel.empty() {
    return Hotel(
      id: '',
      name: '',
      destination: '',
      category: 0,
      categoryType: '',
      images: [],
      bestOffer: BestOffer.empty(),
      ratingInfo: RatingInfo.empty(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    destination,
    category,
    categoryType,
    images,
    bestOffer,
    ratingInfo,
  ];

  @override
  String toString() {
    return 'Hotel(id: $id, name: $name, destination: $destination, category: $category, categoryType: $categoryType, images: $images, bestOffer: $bestOffer, ratingInfo: $ratingInfo)';
  }

  Map<String, dynamic> toMap() {
    return {
      kHotelId: id,
      kHotelName: name,
      kDestination: destination,
      kCategory: category,
      kCategoryType: categoryType,
      kImages: images.map((x) => x.toMap()).toList(),
      kBestOffer: bestOffer.toMap(),
      kRatingInfo: ratingInfo.toMap(),
    };
  }
}
