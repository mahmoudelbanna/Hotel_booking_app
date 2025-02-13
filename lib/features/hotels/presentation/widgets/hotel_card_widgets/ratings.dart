import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        hotel.category,
        (_) => Icon(Icons.star, color: Colors.black, size: 18),
      ),
    );
  }
}
