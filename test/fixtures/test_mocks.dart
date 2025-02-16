import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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

// Mock class for HotelModel
class MockHotelModel extends Mock implements HotelModel {}

// Mock class for BestOfferModel
class MockBestOfferModel extends Mock implements BestOfferModel {}

// Mock class for HotelImageModel
class MockHotelImageModel extends Mock implements HotelImageModel {}

// Mock class for OverallModel
class MockOverallModel extends Mock implements OverallModel {}

// Mock class for RatingInfoModel
class MockRatingInfoModel extends Mock implements RatingInfoModel {}

// Mock class for RoomModel
class MockRoomModel extends Mock implements RoomModel {}

// Mock class for TravelDateModel
class MockTravelDateModel extends Mock implements TravelDateModel {}
