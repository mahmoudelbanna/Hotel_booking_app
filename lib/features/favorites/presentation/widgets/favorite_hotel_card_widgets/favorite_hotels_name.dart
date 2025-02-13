import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelName extends StatelessWidget {
  const FavoriteHotelName({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotel[kHotelName],
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
