import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'best_offer_model.freezed.dart';
part 'best_offer_model.g.dart';

@freezed
class BestOfferModel
    with _$BestOfferModel, EntityConvertible<BestOfferModel, BestOffer> {
  // ignore: unused_element
  const BestOfferModel._();
  const factory BestOfferModel({
    @JsonKey(name: kOriginalTravelPrice) required int originalTravelPrice,
    @JsonKey(name: kSimplePricePerPerson) required int simplePricePerPerson,
    @JsonKey(name: kTotal) required int total,
    @JsonKey(name: kTravelPrice) required int travelPrice,
    @JsonKey(name: kFlightIncluded) required bool flightIncluded,
    @JsonKey(name: kRooms) required RoomModel room,
    @JsonKey(name: kTravelDate) required TravelDateModel travelDate,
  }) = _BestOfferModel;

  factory BestOfferModel.fromJson(Map<String, dynamic> json) =>
      _$BestOfferModelFromJson(json);

  @override
  BestOffer toEntity() => BestOffer(
    originalTravelPrice: originalTravelPrice,
    simplePricePerPerson: simplePricePerPerson,
    total: total,
    travelPrice: travelPrice,
    flightIncluded: flightIncluded,
    room: room.toEntity(),
    travelDate: travelDate.toEntity(),
  );
}
