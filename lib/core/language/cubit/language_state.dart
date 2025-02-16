import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.freezed.dart';
part 'language_state.g.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({String? languageCode, String? countryCode}) =
      _LanguageState;

  factory LanguageState.fromJson(Map<String, dynamic> json) =>
      _$LanguageStateFromJson(json);
}
