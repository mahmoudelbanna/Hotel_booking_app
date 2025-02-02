import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class Room extends Equatable {
  const Room({
    required this.boarding,
    required this.type,
    required this.adultCount,
    required this.childrenCount,
    required this.travelDate,
  });

  final String boarding;
  final String type;
  final int adultCount;
  final int childrenCount;
  final TravelDate travelDate;

  @override
  List<Object?> get props => [
        boarding,
        type,
        adultCount,
        childrenCount,
        travelDate,
      ];

  @override
  String toString() {
    return 'Room(boarding: $boarding, type: $type, adultCount: $adultCount, childrenCount: $childrenCount, travelDate: $travelDate)';
  }

  Map<String, dynamic> toMap() {
    return {
      kBoarding: boarding,
      kBestOfferName: type,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
      kTravelDate: travelDate.toMap(),
    };
  }
}
