import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class TravelDate extends Equatable {
  const TravelDate({required this.days, required this.nights});

  factory TravelDate.empty() {
    return const TravelDate(days: 0, nights: 0);
  }

  final int days;
  final int nights;

  @override
  List<Object?> get props => [days, nights];

  @override
  String toString() {
    return 'TravelDate(days: $days, nights: $nights)';
  }

  Map<String, dynamic> toMap() {
    return {kDays: days, kNights: nights};
  }
}
