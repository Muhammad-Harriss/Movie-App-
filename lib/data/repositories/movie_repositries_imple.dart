import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_sources.dart';
import 'package:movie_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movies_models.dart';
import 'package:movie_app/domain/entities/app_error.dart';

import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/vedios_entities.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';

class MovieRepositriesImpl extends MoviesRepositries {
  final MovieRemoteDataSources remoteDataSources;

  // Constructor
  MovieRepositriesImpl(this.remoteDataSources);

  @override
  Future<Either<AppError, List<MoviesModel>>> getTrending() async {
    try {
      final movies = await remoteDataSources.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSources.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSources.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSources.getComingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSources.getMovieDetail(id); // FIXED: passing id
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

 @override
Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
  try {
    final castCrew = await remoteDataSources.getCastCrew(id);
    return Right(castCrew);
  } on SocketException {
    return Left(AppError(AppErrorType.network));
  } on Exception {
    return Left(AppError(AppErrorType.api));
  }
}

  @override
  Future<Either<AppError, List<VediosEntities>>> getvideos(int id) async{
    try {
    final videos = await remoteDataSources.getVedios(id);
    return Right(videos);
  } on SocketException {
    return Left(AppError(AppErrorType.network));
  } on Exception {
    return Left(AppError(AppErrorType.api));
  }
  }

}
