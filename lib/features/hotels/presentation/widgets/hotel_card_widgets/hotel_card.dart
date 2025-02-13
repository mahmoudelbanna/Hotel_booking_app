import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({super.key, required this.hotel});

  final Hotel hotel;

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
            ImageFavoriteIconWidget(hotel: hotel),
            ContentWidget(hotel: hotel),
          ],
        ),
      ),
    );
  }
}
