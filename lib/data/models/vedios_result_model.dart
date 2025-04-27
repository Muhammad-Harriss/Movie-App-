import 'package:movie_app/data/models/vedios_model.dart';

class VediosResultModel {
  int? id;
  List<VediosModel>? vedios;

  VediosResultModel({this.id, this.vedios});

  VediosResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      vedios = <VediosModel>[];
      json['results'].forEach((v) {
        vedios!.add(new VediosModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.vedios != null) {
      data['results'] = this.vedios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

