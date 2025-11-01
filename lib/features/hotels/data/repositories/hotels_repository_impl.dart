import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../hotel_booking_app.dart';

class HotelsRepositoryImpl implements HotelsRepository {
  const HotelsRepositoryImpl({required this.remoteDataSource});

  final HotelsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Hotel>>> getHotels() async {
    try {
      final hotelModels = await remoteDataSource.getHotels();

      final hotels = hotelModels
          .map<Hotel>((hotelModel) => hotelModel.toEntity())
          .toList();

      return Right(hotels);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(message: e.message));
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Unexpected error in repository: $e');
      }
      return const Left(ServerFailure());
    }
  }
}
