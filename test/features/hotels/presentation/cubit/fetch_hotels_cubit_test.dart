import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_hotel_data.dart';
import 'fetch_hotels_cubit_test.mocks.dart';

@GenerateMocks([GetHotels])
void main() {
  late FetchHotelsCubit cubit;
  late MockGetHotels mockGetHotels;
  setUp(() {
    mockGetHotels = MockGetHotels();
    cubit = FetchHotelsCubit(usecase: mockGetHotels);
  });
  tearDown(() {
    cubit.close();
  });

  test('initialState should be FetchHotelsLoading', () {
    // assert
    expect(cubit.state, const FetchHotelsLoading());
  });

  group('fetchHotels', () {
    test('should emit [FetchHotelsLoading, FetchHotelsLoaded] when success',
        () async {
      // arrange
      final tHotel = [TestHotelData.hotel];

      when(mockGetHotels()).thenAnswer((_) async => Right(tHotel));

      // act
      cubit.fetchHotels();

      // Assert that the initial state is correct.
      expect(cubit.state, const FetchHotelsLoading());

      // assert later
      await expectLater(
        cubit.stream,
        emits(FetchHotelsSuccess(hotels: tHotel)),
      );
      // Assert that the current state is in sync with the stubbed stream.
      expect(cubit.state, FetchHotelsSuccess(hotels: tHotel));
    });

    test('should emit [FetchHotelsLoading, FetchHotelsFailure] when failure',
        () async {
      // arrange
      when(mockGetHotels()).thenAnswer(
        (_) async => const Left(ServerFailure()),
      );

      // act
      cubit.fetchHotels(); // Ensure this is awaited

      // Assert initial state
      expect(cubit.state, const FetchHotelsLoading());

      // assert later
      await expectLater(
        cubit.stream,
        emits(const FetchHotelsFailure()),
      );

      // Assert final state
      expect(cubit.state, const FetchHotelsFailure());
    });
  });
}

