import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_Playing_now.dart';
import 'package:movie_app/domain/usecases/get_comingSoon.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingsoon getComingsoon;

  MovieTabbedBloc({
    required this.getComingsoon,
    required this.getPlayingNow,
    required this.getPopular,
  }) : super(MovieTabbedInitial()) {
    on<MovieTabChangedEvent>((event, emit) async {
      emit(MovieTabbedLoading(currentTabIndex: event.currentTabIndex));

      Either<AppError, List<MovieEntity>> moviesEither;

      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingsoon(NoParams());
          break;
        default:
          moviesEither = Left(AppError(AppErrorType.api));
      }

      moviesEither.fold(
        (error) => emit(MovieTabLoadError(
          errorType: AppErrorType.network, 
          currentTabIndex: event.currentTabIndex,
        )),
        (movies) => emit(MovieTabChanged(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        )),
      );
    });
  }
}
