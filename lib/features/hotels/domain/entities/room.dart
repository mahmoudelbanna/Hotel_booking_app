import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class Room extends Equatable {
  const Room({
    required this.overall,
  });

  final Overall overall;

  @override
  @override
  List<Object?> get props => [
        overall,
      ];

  @override
  String toString() {
    return 'Room(overall: $overall)';
  }

  Map<String, dynamic> toMap() {
    return {
      kOverall: overall.toMap(),
    };
  }
}
