import 'package:hotel_booking_app/hotel_booking_app.dart';

class TestHotelModelData {
  static final HotelModel hotel = const HotelModel(
    id: '1',
    name: 'Test Hotel',
    destination: 'Test City',
    category: 1,
    categoryType: 'Test Type',
    images: [
      HotelImageModel(
        large: 'test_image_large.jpg',
        small: 'test_image_small.jpg',
      ),
    ],
    bestOffer: BestOfferModel(
      originalTravelPrice: 120,
      simplePricePerPerson: 50,
      total: 110,
      travelPrice: 110,
      flightIncluded: true,
      room: RoomModel(
        overall: OverallModel(
          roomsOverallName: 'Test Room',
          boarding: 'Test Boarding',
          adultCount: 2,
          childrenCount: 0,
        ),
      ),
      travelDate: TravelDateModel(days: 7, nights: 6),
    ),
    ratingInfo: RatingInfoModel(
      score: 4.5,
      scoreDescription: 'Very Good',
      reviewsCount: 100,
      recommendationRate: 90,
    ),
  );
}
