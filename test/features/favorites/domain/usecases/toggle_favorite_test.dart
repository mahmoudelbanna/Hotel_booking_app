import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

import '../../../../fixtures/test_hotel_data.dart';

void main() {
  late ToggleFavoriteUseCase toggleFavorite;

  setUp(() {
    toggleFavorite = ToggleFavoriteUseCase();
  });

  final testHotel = TestHotelData.hotel;
  final testHotelId = testHotel.id;
  final testHotelData = testHotel.toMap();

  test('should add a hotel to favorites when not already present', () {
    final Map<String, dynamic> currentFavorites = {};
    final updatedFavorites = toggleFavorite.call(
      currentFavorites: currentFavorites,
      hotelId: testHotelId,
      hotelData: testHotelData,
    );

    expect(updatedFavorites, {testHotelId: testHotelData});
  });

  test('should remove a hotel from favorites when already present', () {
    final currentFavorites = {testHotelId: testHotelData};
    final updatedFavorites = toggleFavorite.call(
      currentFavorites: currentFavorites,
      hotelId: testHotelId,
      hotelData: testHotelData,
    );

    expect(updatedFavorites, {});
  });
}
