import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_hotel_data.dart';
import 'favorite_bloc_test.mocks.dart';

@GenerateMocks([Storage, ToggleFavoriteUseCase])
void main() {
  late FavoriteBloc favoriteBloc;
  late MockStorage mockStorage;
  late MockToggleFavoriteUseCase mockToggleFavorite;

  setUp(() async {
    mockStorage = MockStorage();
    mockToggleFavorite = MockToggleFavoriteUseCase();
    HydratedBloc.storage = mockStorage;
    favoriteBloc = FavoriteBloc(toggleFavoriteUseCase: mockToggleFavorite);
  });

  tearDown(() {
    favoriteBloc.close();
  });

  final Map<String, dynamic> testEmptyHotel = {};
  final testHotel = TestHotelData.hotel;
  final tHotelId = testHotel.id;
  final testHotelMap = testHotel.toMap();

  test('Initial state should be empty', () {
    expect(favoriteBloc.state, FavoriteState.initial());
    expect(favoriteBloc.state.favorites, equals(testEmptyHotel));
  });

  blocTest<FavoriteBloc, FavoriteState>(
    'should call ToggleFavoriteUseCase and add a hotel to favorites',
    build: () => favoriteBloc,
    setUp: () {
      when(
        mockToggleFavorite.call(
          currentFavorites: {},
          hotelId: tHotelId,
          hotelData: testHotelMap,
        ),
      ).thenReturn({tHotelId: testHotelMap});
    },
    act:
        (bloc) => bloc.add(
          ToggleFavorite(hotelId: tHotelId, hotelData: testHotelMap),
        ),
    expect:
        () => [
          FavoriteState(favorites: {tHotelId: testHotelMap}),
        ],
    verify: (_) {
      verify(
        mockToggleFavorite.call(
          currentFavorites: {},
          hotelId: tHotelId,
          hotelData: testHotelMap,
        ),
      ).called(1);
    },
  );

  blocTest<FavoriteBloc, FavoriteState>(
    'should call ToggleFavoriteUseCase and remove a hotel from favorites',
    build: () => favoriteBloc,
    seed: () => FavoriteState(favorites: {tHotelId: testHotelMap}),
    setUp: () {
      when(
        mockToggleFavorite.call(
          currentFavorites: {tHotelId: testHotelMap},
          hotelId: tHotelId,
          hotelData: testHotelMap,
        ),
      ).thenReturn(testEmptyHotel);
    },
    act:
        (bloc) => bloc.add(
          ToggleFavorite(hotelId: tHotelId, hotelData: testHotelMap),
        ),
    expect: () => [FavoriteState(favorites: testEmptyHotel)],
    verify: (_) {
      verify(
        mockToggleFavorite.call(
          currentFavorites: {tHotelId: testHotelMap},
          hotelId: tHotelId,
          hotelData: testHotelMap,
        ),
      ).called(1);
    },
  );

  test('fromJson restores state correctly', () {
    final json = jsonEncode({tHotelId: testHotelMap});
    expect(
      favoriteBloc.fromJson(jsonDecode(json)),
      FavoriteState(favorites: {tHotelId: testHotelMap}),
    );
  });

  test('toJson saves state correctly', () {
    final state = FavoriteState(favorites: {tHotelId: testHotelMap});
    expect(favoriteBloc.toJson(state), {tHotelId: testHotelMap});
  });
}
