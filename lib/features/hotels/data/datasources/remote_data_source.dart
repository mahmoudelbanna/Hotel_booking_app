import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../hotel_booking_app.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> getHotels();
}

class HotelsRemoteDataSourceImpl implements HotelsRemoteDataSource {
  const HotelsRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<HotelModel>> getHotels() async {
    try {
      final url = dotenv.env['URL'] ?? '';
      final response = await dio.get(url);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data[kHotels];

        if (data is! List) {
          throw ParsingException(
            message: 'Expected a list of hotels but got ${data.runtimeType}',
          );
        }

        try {
          return data
              .map<HotelModel>((hotel) => HotelModel.fromJson(hotel))
              .toList();
        } on Exception catch (e) {
          throw ParsingException(message: e.toString());
        }
      } else {
        throw ServerException(
          message: 'Unexpected status code: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException(message: 'Connection timeout');
      }

      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
          message: e.response?.statusMessage ?? 'Bad response from server',
          statusCode: e.response?.statusCode,
        );
      }

      throw const NetworkException();
    } on ParsingException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Unexpected error in getHotels: $e');
      }
      throw const ServerException();
    }
  }
}
