import 'package:equatable/equatable.dart';

class VediosEntities extends Equatable {
  final String title;
  final String key;
  final String type;

  const VediosEntities(this.title, this.key, this.type);  // added const

  @override
  List<Object?> get props => [title, key, type];  // include all fields in props

  @override
  bool get stringify => true; // small typo: it should be `stringify`, not `stringfy`
}
