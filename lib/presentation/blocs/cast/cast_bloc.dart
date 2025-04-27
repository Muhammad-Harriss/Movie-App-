import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/usecases/get_cast.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;

  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<LoadCastEvent>(_onLoadCastEvent);
  }

  Future<void> _onLoadCastEvent(
    LoadCastEvent event,
    Emitter<CastState> emit,
  ) async {
    emit(CastLoading()); // Emit loading state

    final eitherResponse = await getCast(MoviesParams(event.movieId));

    eitherResponse.fold(
      (l) => emit(CastError()), // Emit error if something goes wrong
      (r) => emit(CastLoaded(casts: r)), // Emit loaded state with casts
    );
  }
}
