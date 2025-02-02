import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../../fixtures/test_hotel_model_data.dart';
import 'hotels_repository_impl_test.mocks.dart';

@GenerateMocks([HotelsRemoteDataSource])
void main() {
  late HotelsRepositoryImpl repository;
  late MockHotelsRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockHotelsRemoteDataSource();
    repository = HotelsRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  final List<HotelModel> tHotelModels = [TestHotelModelData.hotel];

  group('getHotels', () {
    test('should return Right(List<HotelModel>) when the call is successful',
        () async {
      // Arrange
      when(mockRemoteDataSource.getHotels())
          .thenAnswer((_) async => tHotelModels);

      // Act
      final result = await repository.getHotels();

      // Assert
      verify(mockRemoteDataSource.getHotels()).called(1);
      expect(result, Right(tHotelModels));
    });

    test('should return Left(ServerFailure) when a ServerException occurs',
        () async {
      // Arrange
      when(mockRemoteDataSource.getHotels()).thenThrow(ServerException());

      // Act
      final result = await repository.getHotels();

      // Assert
      verify(mockRemoteDataSource.getHotels()).called(1);
      expect(result,
          Left(ServerFailure(errorMessage: 'This is a server exception')));
    });

    test('should return Left(ServerFailure) when an unknown exception occurs',
        () async {
      // Arrange
      when(mockRemoteDataSource.getHotels()).thenThrow(Exception());

      // Act
      final result = await repository.getHotels();

      // Assert
      verify(mockRemoteDataSource.getHotels()).called(1);
      expect(result,
          Left(ServerFailure(errorMessage: 'This is a server exception')));
    });
  });
}
