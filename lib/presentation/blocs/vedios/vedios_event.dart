part of 'vedios_bloc.dart';

sealed class VediosEvent extends Equatable {
  const VediosEvent();

  @override
  List<Object> get props => [];
}

class LoadVideosEvent extends VediosEvent {
  final int movieId;

  LoadVideosEvent(this.movieId);

  @override
  List<Object> get props => [movieId];



}
