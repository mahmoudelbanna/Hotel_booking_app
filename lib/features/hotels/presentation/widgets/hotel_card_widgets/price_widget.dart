import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../hotel_booking_app.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat("#,##0.00", "de_DE");
    final total = currencyFormat.format(hotel.bestOffer.total / 100);
    final simplePricePerPerson = currencyFormat.format(
      hotel.bestOffer.simplePricePerPerson / 100,
    );
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${context.l10n.ab} ',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  overflow: TextOverflow.fade,
                ),
              ),
              TextSpan(
                text: '$total €',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
        Text(
          '$simplePricePerPerson € p.P.',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.grey,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
