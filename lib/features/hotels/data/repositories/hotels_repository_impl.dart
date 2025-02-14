import 'package:dartz/dartz.dart';

import '../../../../hotel_booking_app.dart';

class HotelsRepositoryImpl implements HotelsRepository {
  final HotelsRemoteDataSource remoteDataSource;

  const HotelsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Hotel>>> getHotels() async {
    try {
      final hotelModels = await remoteDataSource.getHotels();

      final hotels =
          hotelModels.map((hotelModel) => hotelModel.toEntity()).toList();

      return Right(hotels);
    } on ServerException {
      return Left(const ServerFailure());
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
