part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  MovieTabbedInitial() : super(currentTabIndex: 0);
}

class MovieTabbedLoading extends MovieTabbedState {
  MovieTabbedLoading({required int currentTabIndex}) : super(currentTabIndex: currentTabIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  MovieTabChanged({
    required int currentTabIndex,
    required this.movies,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  MovieTabLoadError({
    required this.errorType,
    required int currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, errorType];
}
