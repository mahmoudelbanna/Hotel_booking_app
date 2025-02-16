import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../hotel_booking_app.dart';

part 'travel_date_model.freezed.dart';
part 'travel_date_model.g.dart';

@freezed
class TravelDateModel
    with _$TravelDateModel, EntityConvertible<TravelDateModel, TravelDate> {
  // ignore: unused_element
  const TravelDateModel._();
  const factory TravelDateModel({
    @JsonKey(name: kDays) required int days,
    @JsonKey(name: kNights) required int nights,
  }) = _TravelDateModel;

  factory TravelDateModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDateModelFromJson(json);

  @override
  TravelDate toEntity() => TravelDate(days: days, nights: nights);
}
