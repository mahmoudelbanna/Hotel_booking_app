import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../hotel_booking_app.dart';

part 'rating_info_model.freezed.dart';
part 'rating_info_model.g.dart';

@freezed
class RatingInfoModel
    with _$RatingInfoModel, EntityConvertible<RatingInfoModel, RatingInfo> {
       // ignore: unused_element
  const RatingInfoModel._();
  const factory RatingInfoModel({
    @JsonKey(name: kScore) required num score,
    @JsonKey(name: kScoreDescription) required String scoreDescription,
    @JsonKey(name: kReviewsCount) required int reviewsCount,
    @JsonKey(name: kRecommendationRate) required int recommendationRate,
  }) = _RatingInfoModel;

  factory RatingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RatingInfoModelFromJson(json);

  @override
  RatingInfo toEntity() => RatingInfo(
    recommendationRate: recommendationRate,
    reviewsCount: reviewsCount,
    score: score,
    scoreDescription: scoreDescription,
  );
}
