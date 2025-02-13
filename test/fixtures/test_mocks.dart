import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

@GenerateMocks([
  FetchHotelsCubit,
  GetHotels,
  HotelsRemoteDataSource,
  HotelsRepository,
  FavoriteBloc,
  LanguageCubit,
  InternetCubit,
  Storage,
  Connectivity,
  InternetConnectionChecker,
  ToggleFavoriteUseCase,
  Dio,
])
abstract class TestMocks {}
