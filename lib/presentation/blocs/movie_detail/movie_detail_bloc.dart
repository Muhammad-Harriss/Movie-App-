import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/vedios/vedios_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VediosBloc vediosBloc;

  MovieDetailBloc(
     
    {required this.getMovieDetail, required this.castBloc, required this.vediosBloc }
  ) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(_onLoadMovieDetail);
  }

  Future<void> _onLoadMovieDetail(
    MovieDetailLoadEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(MovieDetailLoading());

    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(MoviesParams(event.movieId));

    eitherResponse.fold(
      (l) => emit(MovieDetailError()),
      (r) => emit(MovieDetailLoaded(movieDetailEntity: r)),
    );

    castBloc.add(LoadCastEvent(movieId: event.movieId));
    vediosBloc.add(LoadVideosEvent(event.movieId));  // <-- fixed here
  }
}
