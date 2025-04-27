import 'package:movie_app/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool? adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  final double voteAverage;
  final int? voteCount;

  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          overview: overview,
          posterPath: posterPath,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: json['genres'] != null
          ? List<Genres>.from(json['genres'].map((v) => Genres.fromJson(v)))
          : [],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'])
          : [],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null
          ? List<ProductionCompanies>.from(
              json['production_companies'].map(
                  (v) => ProductionCompanies.fromJson(v)))
          : [],
      productionCountries: json['production_countries'] != null
          ? List<ProductionCountries>.from(
              json['production_countries'].map(
                  (v) => ProductionCountries.fromJson(v)))
          : [],
      releaseDate: json['release_date'] ?? '',
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null
          ? List<SpokenLanguages>.from(json['spoken_languages']
              .map((v) => SpokenLanguages.fromJson(v)))
          : [],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'] ?? '',
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
    );
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'iso_3166_1': iso31661,
        'name': name,
      };
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'english_name': englishName,
        'iso_639_1': iso6391,
        'name': name,
      };
}
