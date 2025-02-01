part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState({this.languageCode, this.countryCode});

  factory LanguageState.fromMap(Map<String, dynamic> map) {
    return LanguageState(
      languageCode: map["languageCode"],
      countryCode: map["countryCode"],
    );
  }

  final String? countryCode;
  final String? languageCode;

  @override
  List<Object?> get props => [countryCode, languageCode];

  @override
  String toString() {
    return 'LanguageState{languageCode: $languageCode, countryCode: $countryCode}';
  }

  Map<String, dynamic> toMap() {
    return {
      "languageCode": languageCode,
      "countryCode": countryCode,
    };
  }
}
