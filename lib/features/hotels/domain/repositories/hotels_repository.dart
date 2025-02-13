import 'package:dartz/dartz.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

abstract class HotelsRepository {
  Future<Either<Failure, List<Hotel>>> getHotels();
}
