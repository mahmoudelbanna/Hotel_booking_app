import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class DurationDaysNights extends StatelessWidget {
  const DurationDaysNights({
    super.key,
    required this.hotel,
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return DetailsText(
      text:
          '${hotel.bestOffer.travelDate.days} ${context.l10n.days} | ${hotel.bestOffer.travelDate.nights} ${context.l10n.nights}',
    );
  }
}
