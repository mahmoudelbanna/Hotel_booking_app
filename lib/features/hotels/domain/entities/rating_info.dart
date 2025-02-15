import 'package:equatable/equatable.dart';

import '../../../../hotel_booking_app.dart';

class RatingInfo extends Equatable {
  const RatingInfo({
    required this.recommendationRate,
    required this.reviewsCount,
    required this.score,
    required this.scoreDescription,
  });
  factory RatingInfo.empty() {
    return RatingInfo(
      recommendationRate: 0,
      reviewsCount: 0,
      score: 0,
      scoreDescription: '',
    );
  }
  final int recommendationRate;
  final int reviewsCount;
  final num score; //! return from Api int and double, defines as num
  final String scoreDescription;

  @override
  List<Object?> get props => [
    recommendationRate,
    reviewsCount,
    score,
    scoreDescription,
  ];

  @override
  String toString() {
    return 'RatingInfo(recommendationRate: $recommendationRate, reviewsCount: $reviewsCount, score: $score, scoreDescription: $scoreDescription)';
  }

  Map<String, dynamic> toMap() {
    return {
      kRecommendationRate: recommendationRate,
      kReviewsCount: reviewsCount,
      kScore: score,
      kScoreDescription: scoreDescription,
    };
  }
}
