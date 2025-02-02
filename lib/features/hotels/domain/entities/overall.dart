import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class Overall extends Equatable {
  const Overall({
    required this.boarding,
    required this.kRoomsOverallName,
    required this.adultCount,
    required this.childrenCount,
  });

  final String boarding;
  final String kRoomsOverallName;
  final int adultCount;
  final int childrenCount;

  @override
  List<Object?> get props => [
        boarding,
        kRoomsOverallName,
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
      kRoomsOverallName: kRoomsOverallName,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
    };
  }
}
