import 'package:movie_app/domain/entities/movie_entity.dart';

class MoviesModel extends MovieEntity {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MoviesModel({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
          posterPath: posterPath ?? "",  // Default empty string if null
          id: id ?? 0,  // Default to 0 if null
          backdropPath: backdropPath ?? "",  // Default empty string if null
          title: title ?? "",  // Default empty string if null
          voteAverage: voteAverage ?? 0.0,  // Default to 0.0 if null
          releaseDate: releaseDate ?? "",  // Default empty string if null
          overview: overview,  // Allow null if not provided
        );

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      backdropPath: json['backdrop_path']?.toString(),
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: json['popularity']?.toDouble(),
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
