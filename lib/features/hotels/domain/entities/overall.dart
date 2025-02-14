import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotel_booking_app/hotel_booking_app.dart';

part 'overall.freezed.dart';

@freezed
class Overall with _$Overall {
  const Overall._();
  const factory Overall({
    required String boarding,
    required String roomsOverallName,
    required int adultCount,
    required int childrenCount,
  }) = _Overall;

  factory Overall.empty() => const Overall(
    boarding: '',
    roomsOverallName: '',
    adultCount: 0,
    childrenCount: 0,
  );

  Map<String, dynamic> toMap() {
    return {
      kBoarding: boarding,
      kRoomsOverallName: roomsOverallName,
      kAdultCount: adultCount,
      kChildrenCount: childrenCount,
    };
  }
}
