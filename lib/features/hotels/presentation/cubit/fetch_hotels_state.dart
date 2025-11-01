import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../hotel_booking_app.dart';

part 'fetch_hotels_state.freezed.dart';

@freezed
class FetchHotelsState with _$FetchHotelsState {
  const FetchHotelsState._();
  
  const factory FetchHotelsState.loading() = _FetchHotelsLoading;
  const factory FetchHotelsState.success({required List<Hotel> hotels}) =
      _FetchHotelsSuccess;
  const factory FetchHotelsState.failure({String? message}) =
      _FetchHotelsFailure;
}
