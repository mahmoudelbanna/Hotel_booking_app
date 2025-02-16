import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  void languageSelected(String languageCode, String? countryCode) {
    emit(LanguageState(languageCode: languageCode, countryCode: countryCode));
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    return state.toJson();
  }
}
