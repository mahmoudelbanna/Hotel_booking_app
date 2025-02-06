import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/actual_article_json.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // This fixes the NotInitializedError
  late HotelsRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = HotelsRemoteDataSourceImpl(dio: mockDio);
  });

  final RequestOptions requestOptions = RequestOptions(path: '');

  final url = dotenv.get('URL');

  // ✅ Mock successful response
  void setUpMockHttpClientSuccess200() {
    when(mockDio.get(any)).thenAnswer(
      (_) async {
        return Response(
          requestOptions: requestOptions,
          data: actualArticlesJsonToMap, // Use the correct parsed Map
          statusCode: 200,
        );
      },
    );
  }

  // ✅ Mock failure response
  void setUpMockHttpClientFailure400() {
    when(mockDio.get(any)).thenAnswer(
      (_) async {
        return Response(
          requestOptions: requestOptions,
          data: {"error": "Bad Request"},
          statusCode: 400,
        );
      },
    );
  }

  group('call dio.get', () {
    test('should call dio.get', () async {
      // Arrange
      setUpMockHttpClientSuccess200();

      // Act
      await dataSource.getHotels();

      // Assert
      verify(mockDio.get(url)).called(1);
    });
  });

  group('should return List<HotelModel> when the response code is 200', () {
    final List<HotelModel> tHotelModels =
        (actualArticlesJsonToMap['hotels'] as List)
            .map((hotel) => HotelModel.fromJson(hotel))
            .toList();

    test(
        'should return List<HotelModel> when the response code is 200 (success)',
        () async {
      // Arrange
      setUpMockHttpClientSuccess200();

      // Act
      final result = await dataSource.getHotels();

      // Assert
      expect(result, equals(tHotelModels));
    });
  });

  group('should throw a ServerException when the response code is 400 or other',
      () {
    test(
        'should throw a ServerException when the response code is 400 or other',
        () async {
      // Arrange
      setUpMockHttpClientFailure400();

      // Act
      final call = dataSource.getHotels();

      // Assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}
