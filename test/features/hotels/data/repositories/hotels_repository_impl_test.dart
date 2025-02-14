import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../../fixtures/test_hotel_data.dart';
import '../../../../fixtures/test_hotel_model_data.dart';
import '../../../../fixtures/test_mocks.mocks.dart';

void main() {
  late HotelsRepositoryImpl repository;
  late MockHotelsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockHotelsRemoteDataSource();
    repository = HotelsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final tHotelModels = [TestHotelModelData.hotel];
  final tHotels = [TestHotelData.hotel];

  group('getHotels', () {
    test(
      'should return Right(List<Hotel>) when the call is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getHotels(),
        ).thenAnswer((_) async => tHotelModels);

        // act
        final result = await repository.getHotels();

        // assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected Right, got Left with $failure'),
          (hotels) => expect(hotels, equals(tHotels)),
        );
        verify(mockRemoteDataSource.getHotels());
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return Left(ServerFailure) when a ServerException occurs',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getHotels(),
        ).thenThrow(const ServerException());

        // Act
        final result = await repository.getHotels();

        // Assert
        verify(mockRemoteDataSource.getHotels()).called(1);
        expect(result, const Left(ServerFailure()));
      },
    );

    test(
      'should return Left(ServerFailure) when an unknown exception occurs',
      () async {
        // Arrange
        when(mockRemoteDataSource.getHotels()).thenThrow(Exception());

        // Act
        final result = await repository.getHotels();

        // Assert
        verify(mockRemoteDataSource.getHotels()).called(1);
        expect(result, const Left(ServerFailure()));
      },
    );
  });
}
