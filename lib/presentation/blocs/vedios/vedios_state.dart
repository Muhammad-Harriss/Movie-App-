part of 'vedios_bloc.dart';

sealed class VediosState extends Equatable {
  const VediosState();
  
  @override
  List<Object> get props => [];
}

final class VediosInitial extends VediosState {}

final class NoVedios extends VediosState {}

final class VediosLoaded extends VediosState {
  final List<VediosEntities> vedios;

  VediosLoaded(this.vedios);

  @override
  List<Object> get props => [vedios];


}
