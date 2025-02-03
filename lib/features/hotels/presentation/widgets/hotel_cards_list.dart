import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

class HotelCardsList extends StatelessWidget {
  const HotelCardsList({
    super.key,
    required this.hotels,
  });

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: Theme.of(context).cardColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              centerTitle: false,
              title: HotelsNumbers(hotels: hotels),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HotelCard(hotel: hotels[index]),
              childCount: hotels.length, 
            ),
          ),
        ],
      ),
    );
  }
}

