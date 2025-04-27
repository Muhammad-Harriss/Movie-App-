
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movies_models.dart';
import 'package:movie_app/data/models/movies_result_model.dart';
import 'package:movie_app/data/models/vedios_model.dart';
import 'package:movie_app/data/models/vedios_result_model.dart';

abstract class MovieRemoteDataSources {
  Future<List<MoviesModel>> getTrending();
  Future<List<MoviesModel>> getPopular();
  Future<List<MoviesModel>> getPlayingNow();
  Future<List<MoviesModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VediosModel>> getVedios(int id);
}

class MovieRemoteDataSourcesImpl extends MovieRemoteDataSources {
  final ApiClient _client;

  MovieRemoteDataSourcesImpl(this._client);

  @override
  Future<List<MoviesModel>> getTrending() async {
    try {
      final response = await _client.get('trending/movie/day');  

      // Parse the response and get the movies list
      final moviesResult = MoviesResultModel.fromJson(response);

      // Return the list of MoviesModel from MoviesResultModel
      
      return moviesResult.movies;
    } catch (e) {
      throw Exception('Error fetching trending movies: $e');
    }
  }

  @override
  Future<List<MoviesModel>> getPopular() async {
    try {
      final response = await _client.get('movie/popular');  

      // Parse the response and get the movies list
      final moviesResult = MoviesResultModel.fromJson(response);

      // Return the list of MoviesModel from MoviesResultModel
       print(response);
      return moviesResult.movies;
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }
  
  @override
  Future<List<MoviesModel>> getComingSoon() async{
     try {
      final response = await _client.get('movie/upcoming');  

      // Parse the response and get the movies list
      final moviesResult = MoviesResultModel.fromJson(response);

      // Return the list of MoviesModel from MoviesResultModel
       print(response);
      return moviesResult.movies;
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }
  
  @override
  Future<List<MoviesModel>> getPlayingNow() async{
     try {
      final response = await _client.get('movie/now_playing');  

      // Parse the response and get the movies list
      final moviesResult = MoviesResultModel.fromJson(response);

      // Return the list of MoviesModel from MoviesResultModel
       print(response);
      return moviesResult.movies;
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
    
  }
  
  @override
  Future<MovieDetailModel> getMovieDetail(int id) async{
    try {
      final response = await _client.get('movie/$id');  

      // Parse the response and get the movies list
      final movie = MovieDetailModel.fromJson(response);

      // Return the list of MoviesModel from MoviesResultModel
       print(response);
      return movie;
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }
  
 @override
Future<List<CastModel>> getCastCrew(int id) async {
  try {
    final response = await _client.get('movie/$id/credits');

    final cast = CastCrewResultModel.fromJson(response).cast ?? [];

    print(cast);
    return cast;
  } catch (e) {
    throw Exception('Error fetching cast & crew: $e');
  }
}

  @override
  Future<List<VediosModel>> getVedios(int id) async{
    try {
    final response = await _client.get('movie/$id/videos');

    final videos = VediosResultModel.fromJson(response).vedios ?? [];

    print(videos);
    return videos;
  } catch (e) {
    throw Exception('Error fetching cast & crew: $e');
  }
    
    
  }

}
