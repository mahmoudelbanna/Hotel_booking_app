import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_state.freezed.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.loading() = _InternetLoading;
  const factory InternetState.connected() = _InternetConnected;
  const factory InternetState.disconnected() = _InternetDisconnected;
}
