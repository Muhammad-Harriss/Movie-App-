import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetCast extends Usecase<List<CastEntity>, MoviesParams> {
  final MoviesRepositries repositries;

  GetCast(this.repositries);

  @override
  Future<Either<AppError, List<CastEntity>>> call(MoviesParams params) async {
    return await repositries.getCastCrew(params.id);
  }
}
