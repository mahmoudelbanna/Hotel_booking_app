import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../hotel_booking_app.dart';

part 'travel_date.freezed.dart';

@freezed
class TravelDate with _$TravelDate {
  // ignore: unused_element
  const TravelDate._();
  const factory TravelDate({required int days, required int nights}) =
      _TravelDate;

  factory TravelDate.empty() => const TravelDate(days: 0, nights: 0);

  Map<String, dynamic> toMap() {
    return {kDays: days, kNights: nights};
  }
}
