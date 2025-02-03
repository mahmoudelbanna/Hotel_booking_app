
import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelLocation extends StatelessWidget {
  const FavoriteHotelLocation({
    super.key,
    required this.hotel,
  });

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Text(
      hotel[kDestination],
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.grey[700],
          ),
    );
  }
}