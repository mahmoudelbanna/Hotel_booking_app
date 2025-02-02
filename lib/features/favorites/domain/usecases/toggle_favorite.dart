class ToggleFavoriteUseCase {
  Map<String, dynamic> call(
      {required Map<String, dynamic> currentFavorites,
      required String hotelId,
      required Map<String, dynamic> hotelData}) {
    final updatedFavorites = Map<String, dynamic>.from(currentFavorites);

    if (updatedFavorites.containsKey(hotelId)) {
      updatedFavorites.remove(hotelId);
    } else {
      updatedFavorites[hotelId] = hotelData;
    }

    return updatedFavorites;
  }
}
