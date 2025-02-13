class ToggleFavoriteUseCase {
  /// Toggles the favorite status of a hotel.
  ///
  /// If the hotel with the given [hotelId] is already in [currentFavorites],
  /// it will be removed. Otherwise, it will be added with the provided [hotelData].
  ///
  /// Returns a new map of updated favorites.

  Map<String, dynamic> call({
    required Map<String, dynamic> currentFavorites,
    required String hotelId,
    required Map<String, dynamic> hotelData,
  }) {
    final updatedFavorites = Map<String, dynamic>.from(currentFavorites);

    if (updatedFavorites.containsKey(hotelId)) {
      updatedFavorites.remove(hotelId);
    } else {
      updatedFavorites[hotelId] = hotelData;
    }

    return updatedFavorites;
  }
}
