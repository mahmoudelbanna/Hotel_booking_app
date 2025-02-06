import 'package:hotel_booking_app/hotel_booking_app.dart';

class TestFavoriteHotelData {
  static final Map<String, dynamic> favoriteHotelA = {
    kHotelId: '1',
    kHotelName: 'Test Hotel',
    kDestination: 'Test City',
    kCategory: 1,
    kCategoryType: 'Test Type',
    kImages: [
      {
        kImageLarge: 'test_image_large.jpg',
        kImageSmall: 'test_image_small.jpg',
      }
    ],
    kBestOffer: {
      kOriginalTravelPrice: 120,
      kSimplePricePerPerson: 50,
      kTotal: 110,
      kTravelPrice: 110,
      kFlightIncluded: true,
      kRooms: {
        kOverall: {
          kRoomsOverallName: 'Test Room',
          kBoarding: 'Test Boarding',
          kAdultCount: 2,
          kChildrenCount: 0,
        },
      },
      kTravelDate: {
        kDays: 7,
        kNights: 6,
      },
    },
    kRatingInfo: {
      kScore: 4.5,
      kScoreDescription: 'Very Good',
      kReviewsCount: 100,
      kRecommendationRate: 90,
    },
  };
  static final Map<String, dynamic> favoriteHotelB = {
    kHotelId: '2',
    kHotelName: 'Test Hotel B',
    kDestination: 'Test City B',
    kCategory: 2,
    kCategoryType: 'Test Type B',
    kImages: [
      {
        kImageLarge: 'test_image_large.jpg',
        kImageSmall: 'test_image_small.jpg',
      }
    ],
    kBestOffer: {
      kOriginalTravelPrice: 120,
      kSimplePricePerPerson: 50,
      kTotal: 110,
      kTravelPrice: 110,
      kFlightIncluded: true,
      kRooms: {
        kOverall: {
          kRoomsOverallName: 'Test Room',
          kBoarding: 'Test Boarding',
          kAdultCount: 2,
          kChildrenCount: 0,
        },
      },
      kTravelDate: {
        kDays: 7,
        kNights: 6,
      },
    },
    kRatingInfo: {
      kScore: 4.5,
      kScoreDescription: 'Very Good',
      kReviewsCount: 100,
      kRecommendationRate: 90,
    },
  };
}
