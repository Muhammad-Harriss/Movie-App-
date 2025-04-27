import 'package:equatable/equatable.dart';

class Movie {
  final String title;
  final String description;

  Movie({required this.title, required this.description});
}

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<Movie> movies;  // List of Movie objects
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, required this.defaultIndex});

  @override
  List<Object> get props => [movies, defaultIndex];
}

class MovieCarouselError extends MovieCarouselState {}
