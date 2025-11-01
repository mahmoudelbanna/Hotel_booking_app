import '../core.dart';

class FailureToMessage {
  const FailureToMessage._();

  static String call({required Failure failure}) {
    if (failure is ServerFailure) {
      return failure.message ?? serverFailureMessage;
    }
    if (failure is NetworkFailure) {
      return failure.message ?? networkFailureMessage;
    }
    if (failure is ParsingFailure) {
      return failure.message ?? parsingFailureMessage;
    }
    return 'Unexpected Error';
  }
}

const String serverFailureMessage = 'Server Error';
const String networkFailureMessage = 'Network Error';
const String parsingFailureMessage = 'Data Parsing Error';
