import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class BestOffer extends Equatable {
  const BestOffer({
    required this.originalTravelPrice,
    required this.simplePricePerPerson,
    required this.total,
    required this.travelPrice,
    required this.flightIncluded,
    required this.room,
  });

  final int originalTravelPrice;
  final int simplePricePerPerson;
  final int total;
  final int travelPrice;
  final bool flightIncluded;
  final Room room;

  @override
  List<Object?> get props => [
        originalTravelPrice,
        simplePricePerPerson,
        total,
        travelPrice,
        flightIncluded,
        room,
      ];

  @override
  String toString() {
    return 'BestOffer(originalTravelPrice: $originalTravelPrice, simplePricePerPerson: $simplePricePerPerson, total: $total, travelPrice: $travelPrice, flightIncluded: $flightIncluded, room: $room)';
  }

  Map<String, dynamic> toMap() {
    return {
      kOriginalTravelPrice: originalTravelPrice,
      kSimplePricePerPerson: simplePricePerPerson,
      kTotal: total,
      kTravelPrice: travelPrice,
      kFlightIncluded: flightIncluded,
      kRooms: room.toMap(),

    };
  }
}
