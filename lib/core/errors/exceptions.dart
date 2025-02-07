class ServerException implements Exception {
  const ServerException();
  @override
  String toString() => 'ServerException: An error occurred with the server';
}
