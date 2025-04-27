import 'package:movie_app/data/models/movies_models.dart';

class MoviesResultModel {
  final List<MoviesModel> movies;

  MoviesResultModel({required this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    var moviesJson = json['results'] as List? ?? [];
    List<MoviesModel> moviesList = moviesJson
        .map((movieJson) => MoviesModel.fromJson(movieJson))
        .toList();
    
    return MoviesResultModel(movies: moviesList);
  }
}
