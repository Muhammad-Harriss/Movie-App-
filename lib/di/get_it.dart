import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/data/repositories/movie_repositries_imple.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';
import 'package:movie_app/domain/usecases/get_Playing_now.dart';
import 'package:movie_app/domain/usecases/get_cast.dart';
import 'package:movie_app/domain/usecases/get_comingSoon.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/domain/usecases/get_vedios.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/languages/bloc/languages_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/bloc/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart'
    as MovieCarouselBloc;
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/bloc/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/blocs/vedios/vedios_bloc.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  /// Core
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  /// Data Sources
  getItInstance.registerLazySingleton<MovieRemoteDataSources>(
    () => MovieRemoteDataSourcesImpl(getItInstance()),
  );

  /// Repositories
  getItInstance.registerLazySingleton<MoviesRepositries>(
    () => MovieRepositriesImpl(getItInstance()),
  );

  /// Use Cases
  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingsoon>(() => GetComingsoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
    getItInstance.registerLazySingleton<GetVedios>(() => GetVedios(getItInstance()));

  /// Blocs
  getItInstance.registerFactory(() => MovieBackdropBloc());
  
  getItInstance.registerFactory(
    () => MovieCarouselBloc.MovieCarouselBloc(
      movieBackdropBloc: getItInstance(),
      getTrending: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getPopular: getItInstance(),
        getComingsoon: getItInstance(),
        getPlayingNow: getItInstance(),
      ));

  getItInstance.registerSingleton<LanguagesBloc>(LanguagesBloc());

  getItInstance.registerFactory(() => CastBloc(getCast: getItInstance()));

  getItInstance.registerFactory(() => VediosBloc(getItInstance()));


  getItInstance.registerFactory(() => MovieDetailBloc(
        castBloc: getItInstance(),
        getMovieDetail: getItInstance(),
        vediosBloc: getItInstance(),
      ));
}
