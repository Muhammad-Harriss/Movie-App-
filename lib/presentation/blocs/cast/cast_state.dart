part of 'cast_bloc.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {}

final class CastLoaded extends CastState {
  final List<CastEntity> casts;

  CastLoaded({required this.casts});

  @override
  List<Object> get props => [casts];
}

final class CastLoading extends CastState {}

final class CastError extends CastState {}
