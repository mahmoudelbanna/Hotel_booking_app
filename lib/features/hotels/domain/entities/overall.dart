import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class Overall extends Equatable {
  const Overall({
    required this.boarding,
    required this.roomsOverallName,
    required this.adultCount,
    required this.childrenCount,
  });

  final String boarding;
  final String roomsOverallName;
  final int adultCount;
  final int childrenCount;

  @override
  List<Object?> get props => [
        boarding,
        roomsOverallName,
        adultCount,
        childrenCount,
      ];

  @override
  String toString() {
    return 'Overall(boarding: $boarding, name: $kRoomsOverallName, adultCount: $adultCount, childrenCount: $childrenCount)';
  }

  Map<String, dynamic> toMap() {
    return {
      kBoarding: boarding,
      kRoomsOverallName: roomsOverallName,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
    };
  }
}
