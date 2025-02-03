import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class HotelName extends StatelessWidget {
  const HotelName({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotel.name,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
