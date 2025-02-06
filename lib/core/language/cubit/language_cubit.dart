import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  void languageSelected(String languageCode, String? countryCode) {
    emit(
      LanguageState(
        languageCode: languageCode,
        countryCode: countryCode,
      ),
    );
  }

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    return state.toMap();
  }
}
