// movie_carousel_state.dart

part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, required this.defaultIndex});

  @override
  List<Object> get props => [movies, defaultIndex];
}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;
  const MovieCarouselError(this.errorType);
}
