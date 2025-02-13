import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class ImageFavoriteIconWidget extends StatelessWidget {
  const ImageFavoriteIconWidget({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HotelImageView(hotel: hotel),
        Positioned(top: 10, right: 10, child: FavoriteToggleIcon(hotel: hotel)),
      ],
    );
  }
}
