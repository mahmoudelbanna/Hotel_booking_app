import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({required Map<String, dynamic> favorites}) =
      _FavoriteState;

  factory FavoriteState.initial() => const FavoriteState(favorites: {});
}
