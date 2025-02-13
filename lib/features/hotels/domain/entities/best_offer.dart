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
    required this.travelDate,
  });

  factory BestOffer.empty() {
    return BestOffer(
      originalTravelPrice: 0,
      simplePricePerPerson: 0,
      total: 0,
      travelPrice: 0,
      flightIncluded: false,
      room: Room.empty(),
      travelDate: TravelDate.empty(),
    );
  }

  final int originalTravelPrice;
  final int simplePricePerPerson;
  final int total;
  final int travelPrice;
  final bool flightIncluded;
  final Room room;
  final TravelDate travelDate;

  @override
  List<Object?> get props => [
    originalTravelPrice,
    simplePricePerPerson,
    total,
    travelPrice,
    flightIncluded,
    room,
    travelDate,
  ];

  @override
  String toString() {
    return 'BestOffer(originalTravelPrice: $originalTravelPrice, simplePricePerPerson: $simplePricePerPerson, total: $total, travelPrice: $travelPrice, flightIncluded: $flightIncluded, room: $room, travelDate: $travelDate)';
  }

  Map<String, dynamic> toMap() {
    return {
      kOriginalTravelPrice: originalTravelPrice,
      kSimplePricePerPerson: simplePricePerPerson,
      kTotal: total,
      kTravelPrice: travelPrice,
      kFlightIncluded: flightIncluded,
      kRooms: room.toMap(),
      kTravelDate: travelDate.toMap(),
    };
  }
}
