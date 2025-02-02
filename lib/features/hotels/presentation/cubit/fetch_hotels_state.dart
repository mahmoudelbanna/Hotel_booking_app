part of 'fetch_hotels_cubit.dart';

sealed class FetchHotelsState extends Equatable {
  const FetchHotelsState();

  @override
  List<Object> get props => [];
}

final class FetchHotelsLoading extends FetchHotelsState {
  const FetchHotelsLoading();
}

final class FetchHotelsSuccess extends FetchHotelsState {
  final List<Hotel> hotels;

  const FetchHotelsSuccess({required this.hotels});

  @override
  List<Object> get props => [hotels];
}

final class FetchHotelsFailure extends FetchHotelsState {
  final String message;

  const FetchHotelsFailure({required this.message});

  @override
  List<Object> get props => [message];
}
