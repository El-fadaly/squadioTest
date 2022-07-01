import 'package:squadio_test/model/pooular_persons/known_for_model.dart';

class PersonModel {
  bool? adult;
  num? gender;
  num? id;
  List<KnownForModel>? knownFor;
  String? knownForDepartment;
  String? name;
  num? popularity;
  String? profilePath;

  PersonModel({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  PersonModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = <KnownForModel>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownForModel.fromJson(v));
      });
    }
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }
}
