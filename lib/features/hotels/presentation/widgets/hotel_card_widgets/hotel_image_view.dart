import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class HotelImageView extends StatelessWidget {
  const HotelImageView({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: hotel.images.isEmpty
          ? Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
            )
          : Image.network(
              hotel.images.first.large,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.broken_image,
                        color: Colors.grey[700], size: 50),
                  ),
                );
              },
            ),
    );
  }
}
