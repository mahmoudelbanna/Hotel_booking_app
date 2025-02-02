import 'package:hotel_booking_app/hotel_booking_app.dart';

class TestHotelData {
  static final Hotel hotel = const Hotel(
    id: '1',
    name: 'Test Hotel',
    destination: 'Test City',
    category: 1,
    categoryType: 'Test Type',
    images: [],
    bestOffer: BestOffer(
      originalTravelPrice: 120,
      simplePricePerPerson: 50,
      total: 110,
      travelPrice: 110,
      flightIncluded: true,
      room: Room(
        overall: Overall(
          roomsOverallName: 'Test Room',
          boarding: 'Test Boarding',
          adultCount: 2,
          childrenCount: 0,
        ),
      ),
      travelDate: TravelDate(
        days: 7,
        nights: 6,
      ),
    ),
    ratingInfo: RatingInfo(
      score: 4.5,
      scoreDescription: 'Very Good',
      reviewsCount: 100,
      recommendationRate: 90,
    ),
  );
}
