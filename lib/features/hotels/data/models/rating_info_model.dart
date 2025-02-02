import '../../../../hotel_booking_app.dart';

class RatingInfoModel extends RatingInfo {
  const RatingInfoModel({
    required super.score,
    required super.scoreDescription,
    required super.reviewsCount,
    required super.recommendationRate,
  });

  factory RatingInfoModel.fromJson(Map<String, dynamic> json) {
    return RatingInfoModel(
      score: json[kScore],
      scoreDescription: json[kScoreDescription],
      reviewsCount: json[kReviewsCount],
      recommendationRate: json[kRecommendationRate],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kScore: score,
      kScoreDescription: scoreDescription,
      kReviewsCount: reviewsCount,
      kRecommendationRate: recommendationRate,
    };
  }
}
