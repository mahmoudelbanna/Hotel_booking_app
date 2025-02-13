import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelCard extends StatelessWidget {
  const FavoriteHotelCard({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            FavoriteHotelImageFavoriteIconWidget(hotel: hotel),
            FavoriteHotelContentWidget(hotel: hotel),
          ],
        ),
      ),
    );
  }
}
