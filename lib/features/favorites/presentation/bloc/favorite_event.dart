import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_event.freezed.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.toggleFavorite({
    required String hotelId,
    required Map<String, dynamic> hotelData,
  }) = ToggleFavorite;
}
