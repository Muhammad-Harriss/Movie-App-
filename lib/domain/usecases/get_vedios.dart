import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movies_params.dart';
import 'package:movie_app/domain/entities/vedios_entities.dart';
import 'package:movie_app/domain/repositries/movies_repositries.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetVedios extends Usecase<List<VediosEntities>, MoviesParams> {
  final MoviesRepositries repositries;

  GetVedios(this.repositries);

  @override
  Future<Either<AppError, List<VediosEntities>>> call(MoviesParams params) async {
    return await repositries.getvideos(params.id);
  }
}
