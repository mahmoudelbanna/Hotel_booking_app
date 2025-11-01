import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../hotel_booking_app.dart';

final getIt = GetIt.instance;

void init() {
  _initCore();
  _initHotels();
  _initFavorites();
}

void _initCore() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: dotenv.env['BASE_URL'] ?? '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    ),
  );

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.instance,
  );

  getIt.registerFactory<InternetCubit>(
    () => InternetCubit(connectivity: getIt(), connectionChecker: getIt()),
  );
}

void _initHotels() {
  getIt.registerLazySingleton<HotelsRemoteDataSource>(
    () => HotelsRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<HotelsRepository>(
    () => HotelsRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<GetHotels>(() => GetHotels(repository: getIt()));

  getIt.registerFactory<FetchHotelsCubit>(
    () => FetchHotelsCubit(usecase: getIt()),
  );
}

void _initFavorites() {
  getIt.registerLazySingleton<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(),
  );

  getIt.registerLazySingleton<FavoriteBloc>(
    () => FavoriteBloc(toggleFavoriteUseCase: getIt()),
  );
}
