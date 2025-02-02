import 'package:dartz/dartz.dart';

import '../../../../hotel_booking_app.dart';

class GetHotels {
  final HotelsRepository repository;

  const GetHotels({required this.repository});

  Future<Either<Failure, List<Hotel>>> call() => repository.getHotels();
}
