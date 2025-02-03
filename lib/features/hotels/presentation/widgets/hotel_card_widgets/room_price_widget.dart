import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class RoomPriceWidget extends StatelessWidget {
  const RoomPriceWidget({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoomDescDuration(hotel: hotel),
        ),
        Expanded(
          child: PriceWidget(hotel: hotel),
        ),
      ],
    );
  }
}
