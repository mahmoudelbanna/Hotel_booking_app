import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelImageFavoriteIconWidget extends StatelessWidget {
  const FavoriteHotelImageFavoriteIconWidget({super.key, required this.hotel});

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FavoriteHotelImageView(hotel: hotel),
        Positioned(
          top: 10,
          right: 10,
          child: FavoriteHotelToggleIcon(
            hotel: hotel,
            onPressed:
                () => context.read<FavoriteBloc>().add(
                  ToggleFavorite(hotelId: hotel[kHotelId], hotelData: hotel),
                ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: FavoriteHotelScoreWidget(hotel: hotel),
        ),
      ],
    );
  }
}
