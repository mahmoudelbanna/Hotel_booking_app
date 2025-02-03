import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class RoomTypes extends StatelessWidget {
  const RoomTypes({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return DetailsText(
      text:
          '${hotel.bestOffer.room.overall.roomsOverallName} | ${hotel.bestOffer.room.overall.boarding}',
    );
  }
}
