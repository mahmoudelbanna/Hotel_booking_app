part of 'internet_cubit.dart';

enum ConnectionType { connected }

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {
  const InternetLoading();
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  const InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {
  const InternetDisconnected();
}
