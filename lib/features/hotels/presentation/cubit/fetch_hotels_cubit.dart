import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

part 'fetch_hotels_state.dart';

class FetchHotelsCubit extends Cubit<FetchHotelsState> {
  final GetHotels usecase;
  FetchHotelsCubit({required this.usecase}) : super(const FetchHotelsLoading());

  void fetchHotels() async {
    emit(const FetchHotelsLoading());

    final fetchedHotels = await usecase();

    fetchedHotels.fold(
      (failure) => emit(
        FetchHotelsFailure(),
      ),
      (hotels) => emit(
        FetchHotelsSuccess(hotels: hotels),
      ),
    );
  }
}
