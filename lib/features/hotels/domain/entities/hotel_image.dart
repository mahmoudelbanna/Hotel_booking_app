import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class HotelImage extends Equatable {
  final String large;
  final String small;

  const HotelImage({required this.large, required this.small});

  @override
  List<Object?> get props => [large, small];

  @override
  String toString() => 'HotelImage(large: $large, small: $small)';

  Map<String, dynamic> toMap() {
    return {
      kImageLarge: large,
      kImageSmall: small,
    };
  }

 
}
