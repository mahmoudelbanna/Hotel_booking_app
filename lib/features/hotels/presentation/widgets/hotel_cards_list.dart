import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

class HotelCardsList extends StatefulWidget {
  const HotelCardsList({super.key, required this.hotels});

  final List<Hotel> hotels;

  @override
  State<HotelCardsList> createState() => _HotelCardsListState();
}

class _HotelCardsListState extends State<HotelCardsList> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: Theme.of(context).cardColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              centerTitle: false,
              title: HotelsNumbers(hotels: widget.hotels),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HotelCard(hotel: widget.hotels[index]),
              childCount: widget.hotels.length,
            ),
          ),
        ],
      ),
    );
  }
}
