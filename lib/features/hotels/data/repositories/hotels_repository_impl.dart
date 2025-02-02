import 'package:dartz/dartz.dart';

import '../../../../hotel_booking_app.dart';



class HotelsRepositoryImpl implements HotelsRepository {
  final HotelsRemoteDataSource remoteDataSource;

  const HotelsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<HotelModel>>> getHotels() async {
    try {
      final hotels = await remoteDataSource.getHotels();

      return Right(hotels);
    } on ServerException {
      return Left(const ServerFailure());
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
