part of 'movie_tabbed_bloc.dart';

sealed class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent  extends MovieTabbedEvent{
  final int currentTabIndex;
  MovieTabChangedEvent({
    this.currentTabIndex = 0,

  });

  List<Object> get props => [currentTabIndex];
}