import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class FavoriteHotelCard extends StatelessWidget {
  const FavoriteHotelCard({
    super.key,
    required this.hotel,
  });

  final dynamic hotel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(hotel[kHotelName]),
      trailing: IconButton(
        icon: const Icon(Icons.favorite, color: Colors.red),
        onPressed: () {
          context.read<FavoriteBloc>().add(
                ToggleFavorite(hotelId: hotel[kHotelId], hotelData: hotel),
              );
        },
      ),
    );
  }
}
