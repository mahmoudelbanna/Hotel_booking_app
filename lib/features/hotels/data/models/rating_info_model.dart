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
      recommendationRate: json[kRecommendationRate],
      reviewsCount: json[kReviewsCount],
      score: json[kScore] == 0 ? 0.0 : (json[kScore] == 3 ? 3.0 : json[kScore]),
      scoreDescription: json[kScoreDescription],
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
