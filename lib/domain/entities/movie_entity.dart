import 'package:equatable/equatable.dart';

 abstract class MovieEntity extends Equatable {
  final String? posterPath;  // Nullable
  final int ?id;
  final String? backdropPath;  // Nullable
  final String ?title;
  final num ?voteAverage;
  final String ?releaseDate;
  final String? overview;  // Nullable

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object?> get props => [id, title];  // Use Object? for nullability.

  bool get strictly => true;  // Fixed typo.
}
