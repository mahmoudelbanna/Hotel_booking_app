import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../hotel_booking_app.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return HotelCard(hotel: Hotel.empty());
          },
        ),
      ),
    );
  }
}
