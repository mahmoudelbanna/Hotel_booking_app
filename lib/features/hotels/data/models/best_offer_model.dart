import '../../../../hotel_booking_app.dart';

class BestOfferModel extends BestOffer {
  const BestOfferModel({
    required super.originalTravelPrice,
    required super.simplePricePerPerson,
    required super.total,
    required super.travelPrice,
    required super.flightIncluded,
    required super.room,
  });

  factory BestOfferModel.fromJson(Map<String, dynamic> json) {
    return BestOfferModel(
      originalTravelPrice: json[kOriginalTravelPrice],
      simplePricePerPerson: json[kSimplePricePerPerson],
      total: json[kTotal],
      travelPrice: json[kTravelPrice],
      flightIncluded: json[kFlightIncluded],
      room: RoomModel.fromJson(json[kRooms]),
    );
  }

  Map<String, dynamic> toJson() {
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
