import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ratings(hotel: hotel),
          HotelName(hotel: hotel),
          HotelLocation(hotel: hotel),
          const Divider(),
          RoomPriceWidget(hotel: hotel),
          const OfferButton(),
        ],
      ),
    );
  }
}
