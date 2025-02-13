import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class RoomDescDuration extends StatelessWidget {
  const RoomDescDuration({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        DurationDaysNights(hotel: hotel),
        RoomTypes(hotel: hotel),
        RoomsDesc(hotel: hotel),
      ],
    );
  }
}
