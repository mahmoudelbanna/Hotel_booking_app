import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../hotel_booking_app.dart';

class FavoriteBloc extends HydratedBloc<FavoriteEvent, FavoriteState> {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoriteBloc({required this.toggleFavoriteUseCase})
    : super(FavoriteState.initial()) {
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<FavoriteState> emit) {
    final updatedFavorites = toggleFavoriteUseCase(
      currentFavorites: state.favorites,
      hotelId: event.hotelId,
      hotelData: event.hotelData,
    );
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
