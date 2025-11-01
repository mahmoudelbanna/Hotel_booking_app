import 'package:dartz/dartz.dart';

import '../../../../hotel_booking_app.dart';

/// Use case for retrieving a list of hotels.
///
/// This use case encapsulates the business logic for fetching hotels.
/// It delegates to the repository and returns an [Either] type for proper error handling.
class GetHotels {
  const GetHotels({required this.repository});

  final HotelsRepository repository;

  /// Executes the use case to retrieve hotels.
  ///
  /// Returns [Right] with a list of [Hotel] entities on success.
  /// Returns [Left] with a [Failure] on error.
  Future<Either<Failure, List<Hotel>>> call() => repository.getHotels();
}
