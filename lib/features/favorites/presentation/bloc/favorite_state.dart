part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState({required this.favorites});

  factory FavoriteState.initial() => const FavoriteState(favorites: {});
  final Map<String, dynamic> favorites;

  @override
  List<Object> get props => [favorites];

  @override
  String toString() => 'FavoriteState(favorites: $favorites)';
}
