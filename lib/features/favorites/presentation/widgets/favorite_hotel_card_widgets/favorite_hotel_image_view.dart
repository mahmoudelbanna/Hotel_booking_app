import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelImageView extends StatelessWidget {
  const FavoriteHotelImageView({
    super.key,
    required this.hotel,
  });

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: CachedNetworkImage(
        imageUrl: hotel[kImages][0][kImageLarge],
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Container(
            height: 200,
            color: Colors.grey[300],
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(
              child:
                  Icon(Icons.broken_image, color: Colors.grey[700], size: 50),
            ),
          );
        },
      ),
    );
  }
}
