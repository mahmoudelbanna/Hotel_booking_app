import '../core.dart';

class FailureToMessage {
  const FailureToMessage._();

  static String call({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return failure.message ?? serverFailureMessage;
      case NetworkFailure _:
        return failure.message ?? networkFailureMessage;
      case ParsingFailure _:
        return failure.message ?? parsingFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}

const String serverFailureMessage = 'Server Error';
const String networkFailureMessage = 'Network Error';
const String parsingFailureMessage = 'Data Parsing Error';
