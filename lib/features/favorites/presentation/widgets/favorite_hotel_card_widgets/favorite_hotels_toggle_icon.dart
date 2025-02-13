import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelToggleIcon extends StatelessWidget {
  const FavoriteHotelToggleIcon({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen:
          (previous, current) =>
              previous.favorites.containsKey(hotel[kHotelId]) !=
              current.favorites.containsKey(hotel[kHotelId]),
      builder: (context, favoriteState) {
        final isFavorite = favoriteState.favorites.containsKey(hotel[kHotelId]);

        return TweenAnimationBuilder<Color?>(
          duration: const Duration(milliseconds: 300),
          tween: ColorTween(end: isFavorite ? Colors.red : Colors.white),
          builder: (context, color, child) {
            return IconButton(
              icon: Icon(Icons.favorite, color: color, size: 40),
              onPressed: () {
                context.read<FavoriteBloc>().add(
                  ToggleFavorite(hotelId: hotel[kHotelId], hotelData: hotel),
                );
              },
            );
          },
        );
      },
    );
  }
}
