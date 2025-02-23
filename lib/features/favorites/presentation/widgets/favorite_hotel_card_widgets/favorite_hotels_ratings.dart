import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelRatings extends StatelessWidget {
  const FavoriteHotelRatings({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        hotel[kCategory],
        (_) => const Icon(Icons.star, color: Colors.black, size: 18),
      ),
    );
  }
}
