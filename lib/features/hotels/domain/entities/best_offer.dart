import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'best_offer.freezed.dart';

@freezed
class BestOffer with _$BestOffer {
  // ignore: unused_element
  const BestOffer._();
  const factory BestOffer({
    required int originalTravelPrice,
    required int simplePricePerPerson,
    required int total,
    required int travelPrice,
    required bool flightIncluded,
    required Room room,
    required TravelDate travelDate,
  }) = _BestOffer;

  factory BestOffer.empty() => BestOffer(
    originalTravelPrice: 0,
    simplePricePerPerson: 0,
    total: 0,
    travelPrice: 0,
    flightIncluded: false,
    room: Room.empty(),
    travelDate: TravelDate.empty(),
  );

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
