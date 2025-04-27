part of 'languages_bloc.dart';

sealed class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object> get props => [];
}

class TogglelanguageEvent extends LanguagesEvent {
  final LanguageEntity language;

  const TogglelanguageEvent(this.language);

  @override
  List<Object> get props => [language.code];
}
