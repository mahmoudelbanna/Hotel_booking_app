import 'package:dartz/dartz.dart';
import '../../../../hotel_booking_app.dart';

abstract class HotelsRepository {
  Future<Either<Failure, List<Hotel>>> getHotels();
}
