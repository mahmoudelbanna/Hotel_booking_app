import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../hotel_booking_app.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelModel>> getHotels();
}

class HotelsRemoteDataSourceImpl implements HotelsRemoteDataSource {
  final Dio dio;

  const HotelsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<HotelModel>> getHotels() async {
    try {
      final kGetHotelsUrl = dotenv.get('URL');
      final response = await dio.get(kGetHotelsUrl);

      if (response.statusCode == 200) {
        final hotels = (response.data[kHotels] as List);
        return hotels.map((hotel) => HotelModel.fromJson(hotel)).toList();
      } else {
        throw const ServerException();
      }
    } catch (e) {
      debugPrint(e.toString());
      throw const ServerException();
    }
  }
}
