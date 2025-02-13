import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelContentWidget extends StatelessWidget {
  const FavoriteHotelContentWidget({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteHotelRatings(hotel: hotel),
          FavoriteHotelName(hotel: hotel),
          FavoriteHotelLocation(hotel: hotel),
          const Divider(),
          const FavoriteHotelButton(),
        ],
      ),
    );
  }
}
