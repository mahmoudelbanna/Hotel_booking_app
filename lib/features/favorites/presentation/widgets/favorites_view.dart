import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        final favoriteHotels = state.favorites.values.toList();

        if (favoriteHotels.isEmpty) {
          return const EmptyListWidget();
        }

        return Scrollbar(
          child: ListView.builder(
            itemCount: favoriteHotels.length,
            itemBuilder: (context, index) {
              final hotel = favoriteHotels[index];
          
              return FavoriteHotelCard(hotel: hotel);
            },
          ),
        );
      },
    );
  }
}
