import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../hotel_booking_app.dart';

part 'rating_info.freezed.dart';

@freezed
class RatingInfo with _$RatingInfo {
  // ignore: unused_element
  const RatingInfo._();
  const factory RatingInfo({
    required int recommendationRate,
    required int reviewsCount,
    required num score,
    required String scoreDescription,
  }) = _RatingInfo;

  factory RatingInfo.empty() => const RatingInfo(
    recommendationRate: 0,
    reviewsCount: 0,
    score: 0,
    scoreDescription: '',
  );

  Map<String, dynamic> toMap() {
    return {
      kRecommendationRate: recommendationRate,
      kReviewsCount: reviewsCount,
      kScore: score,
      kScoreDescription: scoreDescription,
    };
  }
}
