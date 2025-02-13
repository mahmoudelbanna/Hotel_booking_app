import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class RoomsDesc extends StatelessWidget {
  const RoomsDesc({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final children =
        hotel.bestOffer.room.overall.childrenCount > 0
            ? '${hotel.bestOffer.room.overall.childrenCount} ${context.l10n.children}'
            : '';
    final flight =
        hotel.bestOffer.flightIncluded ? context.l10n.flightIncluded : '';
    return DetailsText(
      text:
          '${hotel.bestOffer.room.overall.adultCount} ${context.l10n.adults}, $children$flight',
    );
  }
}
