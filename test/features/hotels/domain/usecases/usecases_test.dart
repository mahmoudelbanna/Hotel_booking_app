import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_hotel_data.dart';
import '../../../../fixtures/test_mocks.mocks.dart';

void main() {
  late GetHotels usecase;
  late MockHotelsRepository mockHotelsRepository;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    usecase = GetHotels(repository: mockHotelsRepository);
  });

  final tHotel = [TestHotelData.hotel];

  test('should get hotel entity from the repository', () async {
    // arrange
    when(
      mockHotelsRepository.getHotels(),
    ).thenAnswer((_) async => Right(tHotel));

    // act
    final result = await usecase();

    // assert
    expect(result, Right(tHotel));
    verify(mockHotelsRepository.getHotels());
    verifyNoMoreInteractions(mockHotelsRepository);
  });

  test('should return Failure when repository fails', () async {
    // arrange
    const tFailure = ServerFailure();
    when(
      mockHotelsRepository.getHotels(),
    ).thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await usecase();

    // assert
    expect(result, const Left(tFailure));
    verify(mockHotelsRepository.getHotels());
    verifyNoMoreInteractions(mockHotelsRepository);
  });
}
