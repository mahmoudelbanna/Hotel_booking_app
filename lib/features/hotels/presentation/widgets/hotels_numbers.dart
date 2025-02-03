import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

class HotelsNumbers extends StatelessWidget {
  const HotelsNumbers({
    super.key,
    required this.hotels,
  });

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${hotels.length} ${context.l10n.hotelsFound}',
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
