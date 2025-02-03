import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelButton extends StatelessWidget {
  const FavoriteHotelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {},
      text: context.l10n.toHotel,
    );
  }
}
