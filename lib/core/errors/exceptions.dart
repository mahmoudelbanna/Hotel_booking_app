class ServerException implements Exception {
  const ServerException({this.message, this.statusCode});

  final String? message;
  final int? statusCode;

  @override
  String toString() {
    if (message != null) {
      return 'ServerException: $message';
    }
    return 'ServerException: An error occurred with the server';
  }
}

/// Exception thrown when network connectivity fails.
class NetworkException implements Exception {
  const NetworkException({this.message});

  final String? message;

  @override
  String toString() {
    return message != null
        ? 'NetworkException: $message'
        : 'NetworkException: No internet connection';
  }
}

/// Exception thrown when parsing JSON data fails.
class ParsingException implements Exception {
  const ParsingException({this.message});

  final String? message;

  @override
  String toString() {
    return message != null
        ? 'ParsingException: $message'
        : 'ParsingException: Failed to parse response data';
  }
}
