import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends HydratedBloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.initial()) {
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<FavoriteState> emit) {
    final updatedFavorites = Map<String, dynamic>.from(state.favorites);

    if (updatedFavorites.containsKey(event.hotelId)) {
      updatedFavorites.remove(event.hotelId);
    } else {
      updatedFavorites[event.hotelId] = event.hotelData;
    }

    emit(FavoriteState(favorites: updatedFavorites));
  }

  @override
  FavoriteState? fromJson(Map<String, dynamic> json) {
    return FavoriteState(favorites: json);
  }

  @override
  Map<String, dynamic>? toJson(FavoriteState state) {
    return state.favorites;
  }
}
