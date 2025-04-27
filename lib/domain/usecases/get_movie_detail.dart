import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetMovieDetail extends Usecase<MovieDetailEntity, MoviesParams>{
  final MoviesRepositries repositries;

  GetMovieDetail(this.repositries);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(MoviesParams moviesParams)async{
    return await repositries.getMovieDetail(moviesParams.id);

  }
}