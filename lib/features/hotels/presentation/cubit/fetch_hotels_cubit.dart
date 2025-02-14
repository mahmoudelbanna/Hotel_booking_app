import 'package:flutter_bloc/flutter_bloc.dart';



import '../../../../hotel_booking_app.dart';

class FetchHotelsCubit extends Cubit<FetchHotelsState> {
  final GetHotels usecase;
  FetchHotelsCubit({required this.usecase})
    : super(const FetchHotelsState.loading());

  void fetchHotels() async {
    emit(const FetchHotelsState.loading());

    final fetchedHotels = await usecase();

    fetchedHotels.fold(
      (failure) => emit(const FetchHotelsState.failure()),
      (hotels) => emit(FetchHotelsState.success(hotels: hotels)),
    );
  }
}
