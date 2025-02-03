import 'package:flutter/material.dart';

import '../../../../../hotel_booking_app.dart';

class FavoriteHotelScoreWidget extends StatelessWidget {
  const FavoriteHotelScoreWidget({
    super.key,
    required this.hotel,
  });

  final dynamic hotel;

  Color getRatingColor(num rating) {
    if (rating >= 4) {
      return Colors.green;
    } else if (rating >= 3) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  IconData getRatingIcon(num rating) {
    if (rating >= 4) {
      return Icons.sentiment_very_satisfied;
    } else if (rating >= 3) {
      return Icons.sentiment_satisfied;
    } else {
      return Icons.sentiment_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rating = hotel[kRatingInfo][kScore];
    final scoreDescription = hotel[kRatingInfo][kScoreDescription];
    final reviewsCount = hotel[kRatingInfo][kReviewsCount];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: getRatingColor(rating),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      getRatingIcon(rating),
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      "$rating / 5.0",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "$scoreDescription ($reviewsCount ${context.l10n.reviews})",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      overflow: TextOverflow.fade,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
