import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetTrending extends Usecase<List<MovieEntity>, NoParams>{
  final MoviesRepositries repositries;

  GetTrending(this.repositries);

  @override
  Future<Either<AppError, List< MovieEntity>>> call(NoParams noparams)async{
    return await repositries.getTrending();

  }
}