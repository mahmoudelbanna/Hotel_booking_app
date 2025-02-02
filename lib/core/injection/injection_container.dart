import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../hotel_booking_app.dart';

final getIt = GetIt.instance;

void init() {
  //!core
  //! Dio client
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );
  //!InternetCubit
  getIt.registerFactory<InternetCubit>(
    () => InternetCubit(
      connectivity: getIt(),
      connectionChecker: getIt(),
    ),
  );
  getIt.registerLazySingleton<Connectivity>(
    () => Connectivity(),
  );
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.instance,
  );

  //!Hotels
  //!GetHotels
  //!FetchHotelsCubit
  getIt.registerFactory<FetchHotelsCubit>(
    () => FetchHotelsCubit(usecase: getIt()),
  );
  getIt.registerLazySingleton<GetHotels>(
    () => GetHotels(repository: getIt()),
  );

  getIt.registerLazySingleton<HotelsRepository>(
    () => HotelsRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<HotelsRemoteDataSource>(
    () => HotelsRemoteDataSourceImpl(
      dio: getIt(),
    ),
  );
}
