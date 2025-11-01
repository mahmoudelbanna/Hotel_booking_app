import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_hotel_data.dart';
import '../../../../fixtures/test_mocks.mocks.dart';

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
    expect(cubit.state, const FetchHotelsState.loading());
  });

  group('fetchHotels', () {
    test(
      'should emit [FetchHotelsLoading, FetchHotelsLoaded] when success',
      () async {
        // arrange
        final tHotel = [TestHotelData.hotel];

        when(mockGetHotels()).thenAnswer((_) async => Right(tHotel));

       
        cubit.fetchHotels();

       
        expect(cubit.state, const FetchHotelsState.loading());

    
        await expectLater(
          cubit.stream,
          emits(FetchHotelsState.success(hotels: tHotel)),
        );
        
        expect(cubit.state, FetchHotelsState.success(hotels: tHotel));
      },
    );

    test(
      'should emit [FetchHotelsLoading, FetchHotelsState.failure()] when failure',
      () async {

        when(
          mockGetHotels(),
        ).thenAnswer((_) async => const Left(ServerFailure()));

 
        expectLater(
          cubit.stream,
          emitsInOrder([
            const FetchHotelsState.loading(),
            const FetchHotelsState.failure(message: 'Server Error'),
          ]),
        );

     
        await cubit.fetchHotels();

      
        expect(cubit.state, const FetchHotelsState.failure(message: 'Server Error'));
      },
    );
  });
}
