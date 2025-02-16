/// A mixin that provides conversion methods between entity and model objects.
///
/// The `EntityConvertible` mixin defines two methods:
/// - `toEntity()`: Converts the implementing object to an entity object.
/// - `fromEntity()`: Converts an entity object to the implementing object.
///
/// This mixin is useful for maintaining a clear separation between data models
/// (which may be used for serialization/deserialization) and domain entities
/// (which represent the business logic of the application).
///
/// Example usage:
/// ```dart
/// class UserEntity {
///   final String id;
///   final String name;
///
///   UserEntity(this.id, this.name);
/// }
///
/// class UserModel with EntityConvertible<UserEntity, UserModel> {
///   final String id;
///   final String name;
///
///   UserModel(this.id, this.name);
///
///   @override
///   UserEntity toEntity() {
///     return UserEntity(id, name);
///   }
///
///   @override
///   UserModel fromEntity(UserEntity entity) {
///     return UserModel(entity.id, entity.name);
///   }
/// }
/// ```
mixin EntityConvertible<I, O> {
  /// Converts the implementing object to an entity object of type [O].
  O toEntity();

  /// Converts an entity object of type [O] to the implementing object of type [I].
  /// This method throws an [UnimplementedError] by default, indicating that
  /// subclasses should provide their own implementation.
  I fromEntity(O model) => throw UnimplementedError();
}
