import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/vedios_entities.dart';

abstract class MoviesRepositries {
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getComingSoon();
  Future<Either<AppError,MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError,List<CastEntity>>> getCastCrew(int id);
   Future<Either<AppError,List<VediosEntities>>> getvideos(int id);
  
}