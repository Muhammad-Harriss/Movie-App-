import 'package:movie_app/domain/entities/vedios_entities.dart';

class VediosModel extends VediosEntities {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? videoKey;
  final String? site;
  final int? size;
  final String? videoType; // changed type -> videoType (to avoid confusion with super.type)
  final bool? official;
  final String? publishedAt;
  final String? id;

  VediosModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.videoKey,
    this.site,
    this.size,
    this.videoType,
    this.official,
    this.publishedAt,
    this.id,
  }) : super(
          name ?? '',
          videoKey ?? '',
          videoType ?? '',
        );

  factory VediosModel.fromJson(Map<String, dynamic> json) {
    return VediosModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      videoKey: json['key'],
      site: json['site'],
      size: json['size'],
      videoType: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'name': name,
      'key': videoKey,
      'site': site,
      'size': size,
      'type': videoType,
      'official': official,
      'published_at': publishedAt,
      'id': id,
    };
  }
}
