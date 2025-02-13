import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class HotelLocation extends StatelessWidget {
  const HotelLocation({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotel.destination,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
    );
  }
}
