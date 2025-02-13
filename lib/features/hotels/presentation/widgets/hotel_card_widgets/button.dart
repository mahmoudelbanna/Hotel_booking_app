import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class OfferButton extends StatelessWidget {
  const OfferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(onPressed: () {}, text: context.l10n.toOffers);
  }
}
