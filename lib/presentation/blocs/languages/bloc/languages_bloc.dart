import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

part 'languages_event.dart';
part 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  // Constructor where we initialize the BLoC and register the event handlers
  LanguagesBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    // Register the event handler for TogglelanguageEvent
    on<TogglelanguageEvent>(_onToggleLanguage);
  }

  // Event handler for TogglelanguageEvent
  void _onToggleLanguage(
    TogglelanguageEvent event,
    Emitter<LanguagesState> emit,
  ) {
    // Change the language and emit the new state
    final newLocale = Locale(event.language.code);
    emit(LanguageLoaded(newLocale));
  }
}
