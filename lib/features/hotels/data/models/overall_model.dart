import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../hotel_booking_app.dart';

part 'overall_model.freezed.dart';
part 'overall_model.g.dart';

@freezed
class OverallModel with _$OverallModel {
  const factory OverallModel({
    @JsonKey(name: kBoarding) required String boarding,
    @JsonKey(name: kRoomsOverallName) required String roomsOverallName,
    @JsonKey(name: kAdultCount) required int adultCount,
    @JsonKey(name: kChildrenCount) required int childrenCount,
  }) = _OverallModel;

  factory OverallModel.fromJson(Map<String, dynamic> json) =>
      _$OverallModelFromJson(json);
}

extension OverallModelX on OverallModel {
  Overall toEntity() => Overall(
    boarding: boarding,
    roomsOverallName: roomsOverallName,
    adultCount: adultCount,
    childrenCount: childrenCount,
  );
}
