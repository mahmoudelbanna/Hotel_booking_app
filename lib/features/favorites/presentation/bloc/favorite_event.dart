part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavorite extends FavoriteEvent {
  const ToggleFavorite({required this.hotelId, required this.hotelData});

  final String hotelId;
  final Map<String, dynamic> hotelData;

  @override
  List<Object> get props => [hotelId, hotelData];

  @override
  String toString() =>
      'ToggleFavorite(hotelId: $hotelId, hotelData: $hotelData)';
}
