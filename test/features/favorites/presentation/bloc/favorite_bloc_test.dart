import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';

import '../../../../fixtures/test_hotel_data.dart';
import 'favorite_bloc_test.mocks.dart';

@GenerateMocks([Storage])
void main() {
  late FavoriteBloc favoriteBloc;
  late MockStorage mockStorage;

  setUp(() async {
    mockStorage = MockStorage();
    HydratedBloc.storage = mockStorage;
    favoriteBloc = FavoriteBloc();
  });

  tearDown(() {
    favoriteBloc.close();
  });

  final testHotel = TestHotelData.hotel;
  final tHotelId = testHotel.id;
  final testHotelMap = testHotel.toMap();

  test('Initial state should be empty', () {
    expect(favoriteBloc.state, FavoriteState.initial());
    expect(favoriteBloc.state.favorites, equals({}));
  });

  blocTest<FavoriteBloc, FavoriteState>(
    'ToggleFavorite adds a hotel to favorites',
    build: () => favoriteBloc,
    act: (bloc) => bloc.add(
      ToggleFavorite(
        hotelId: tHotelId,
        hotelData: testHotelMap,
      ),
    ),
    expect: () => [
      FavoriteState(favorites: {tHotelId: testHotelMap})
    ],
  );

  blocTest<FavoriteBloc, FavoriteState>(
    'ToggleFavorite removes a hotel from favorites',
    build: () => favoriteBloc,
    seed: () => FavoriteState(favorites: {
      tHotelId: testHotelMap,
    }),
    act: (bloc) => bloc.add(
      ToggleFavorite(
        hotelId: tHotelId,
        hotelData: testHotelMap,
      ),
    ),
    expect: () => [FavoriteState(favorites: {})],
  );

  test('fromJson restores state correctly', () {
    final json = jsonEncode({
      tHotelId: testHotelMap,
    });
    expect(
      favoriteBloc.fromJson(jsonDecode(json)),
      FavoriteState(favorites: {
        tHotelId: testHotelMap,
      }),
    );
  });

  test('toJson saves state correctly', () {
    final state = FavoriteState(favorites: {
      tHotelId: testHotelMap,
    });
    expect(favoriteBloc.toJson(state), {
      tHotelId: testHotelMap,
    });
  });
}
