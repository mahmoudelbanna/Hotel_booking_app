import '../core.dart';

class FailureToMessage {
  const FailureToMessage._();

  static String call({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMessage;

      default:
        return 'Unexpected Error';
    }
  }
}

String serverFailureMessage = 'Server Error';
