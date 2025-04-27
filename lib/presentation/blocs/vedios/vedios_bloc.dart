import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/entities/vedios_entities.dart';
import 'package:movie_app/domain/usecases/get_vedios.dart';

part 'vedios_event.dart';
part 'vedios_state.dart';

class VediosBloc extends Bloc<VediosEvent, VediosState> {
  final GetVedios getVedios;

  VediosBloc(this.getVedios) : super(VediosInitial()) {
    on<LoadVideosEvent>(_onLoadVediosEvent);
  }

  Future<void> _onLoadVediosEvent(
    LoadVideosEvent event,
    Emitter<VediosState> emit,
  ) async {
    final Either<AppError, List<VediosEntities>> eitherResponse =
        await getVedios(MoviesParams(event.movieId));

    eitherResponse.fold(
      (l) => emit(NoVedios()),
      (r) => emit(VediosLoaded(r)),
    );
  }
}
