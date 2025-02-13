import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteToggleIcon extends StatelessWidget {
  const FavoriteToggleIcon({
    super.key,
    required this.hotel,
    required this.onPressed,
  });

  final Hotel hotel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen:
          (previous, current) =>
              previous.favorites.containsKey(hotel.id) !=
              current.favorites.containsKey(hotel.id),
      builder: (context, favoriteState) {
        final isFavorite = favoriteState.favorites.containsKey(hotel.id);
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.red : Colors.white,
            size: 40,
          ),
          onPressed: onPressed,
        );
      },
    );
  }
}
