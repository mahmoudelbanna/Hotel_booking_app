import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../hotel_booking_app.dart';

class FavoritesViewAnimated extends StatefulWidget {
  const FavoritesViewAnimated({super.key});

  @override
  State<FavoritesViewAnimated> createState() => _FavoritesViewAnimatedState();
}

class _FavoritesViewAnimatedState extends State<FavoritesViewAnimated> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<dynamic> _favoriteHotels;

  @override
  void initState() {
    super.initState();
    final state = context.read<FavoriteBloc>().state;
    _favoriteHotels = state.favorites.values.toList();
  }

  @override
  void dispose() {
    super.dispose();
    _listKey.currentState?.dispose();
  }

  void _handleAdditions(List<dynamic> newFavorites) {
    for (var entry in newFavorites) {
      if (!_favoriteHotels.any((e) => e[kHotelId] == entry[kHotelId])) {
        final index = newFavorites.indexOf(entry);
        _favoriteHotels.insert(index, entry);
        _listKey.currentState?.insertItem(index);
      }
    }
  }

  void _handleRemovals(List<dynamic> newFavorites) {
    for (var entry in List.of(_favoriteHotels)) {
      if (!newFavorites.any((e) => e[kHotelId] == entry[kHotelId])) {
        final index = _favoriteHotels.indexWhere(
          (e) => e[kHotelId] == entry[kHotelId],
        );
        if (index != -1) {
          _listKey.currentState?.removeItem(
            index,
            (context, animation) => _buildRemovedItem(entry, animation),
            duration: const Duration(milliseconds: 300),
          );
          _favoriteHotels.removeAt(index);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        final newFavorites = state.favorites.values.toList();
        _handleAdditions(newFavorites);
        _handleRemovals(newFavorites);
        _favoriteHotels = newFavorites;
      },
      builder: (context, state) {
        final favoriteHotels = state.favorites.values.toList();
        if (favoriteHotels.isEmpty) {
          return const EmptyListWidget();
        }

        return Scrollbar(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: favoriteHotels.length,
            itemBuilder: (context, index, animation) {
              return _buildAnimatedItem(favoriteHotels[index], animation);
            },
          ),
        );
      },
    );
  }

  Widget _buildAnimatedItem(dynamic hotel, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FavoriteHotelCard(hotel: hotel),
    );
  }

  Widget _buildRemovedItem(dynamic hotel, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: FavoriteHotelCard(hotel: hotel),
    );
  }
}
