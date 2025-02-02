import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  late HotelsRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() async {
    mockDio = MockDio();
    dataSource = HotelsRemoteDataSourceImpl(dio: mockDio);
  });

  final RequestOptions requestOptions = RequestOptions();
  final String actualArticlesJson =
      fixture('hotels.json'); // Ensure this is a valid JSON string
  final url = kGetHotelsUrl;

  // Mock success
  void setUpMockHttpClientSuccess200() {
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: requestOptions,
        data: actualArticlesJson,
        statusCode: 200,
      ),
    );
  }

  // Mock failure
  void setUpMockHttpClientFailure400() {
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: requestOptions,
        data: actualArticlesJson,
        statusCode: 400,
      ),
    );
  }

  group('call dio.get', () {
    test('should call dio.get', () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      await dataSource.getHotels();
      // assert
      verify(mockDio.get(url));
    });
  });

  group('should return List<HotelModel> when the response code is 200', () {
    final List<HotelModel> tHotelModels =
        (json.decode(actualArticlesJson)['hotels'] as List)
            .map((hotel) => HotelModel.fromJson(hotel))
            .toList();

    test(
        'should return List<HotelModel> when the response code is 200 (success)',
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSource.getHotels();
      print('Result received: $result'); // Debug output to see result
      // assert
      expect(result, equals(tHotelModels));
    });
  });

  group('should throw a ServerException when the response code is 404 or other',
      () {
    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      setUpMockHttpClientFailure400();
      // act
      final call = dataSource.getHotels();
      // assert
      expect(call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
