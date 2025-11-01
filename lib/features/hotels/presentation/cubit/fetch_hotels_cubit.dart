import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class FetchHotelsCubit extends Cubit<FetchHotelsState> {
  FetchHotelsCubit({required this.usecase})
    : super(const FetchHotelsState.loading());

  final GetHotels usecase;

  Future<void> fetchHotels() async {
    emit(const FetchHotelsState.loading());

    final fetchedHotels = await usecase();

    fetchedHotels.fold(
      (failure) => emit(
        FetchHotelsState.failure(
          message: FailureToMessage.call(failure: failure),
        ),
      ),
      (hotels) => emit(FetchHotelsState.success(hotels: hotels)),
    );
  }
}
