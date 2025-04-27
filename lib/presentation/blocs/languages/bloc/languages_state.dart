part of 'languages_bloc.dart';

sealed class LanguagesState extends Equatable {
  const LanguagesState();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguagesState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale.languageCode];
}
