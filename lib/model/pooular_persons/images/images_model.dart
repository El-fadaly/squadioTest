import 'package:squadio_test/model/pooular_persons/images/profile_model.dart';

class ImagesModel {
  int? id;
  List<ProfileModel>? profiles;

  ImagesModel({this.id, this.profiles});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = <ProfileModel>[];
      json['profiles'].forEach((v) {
        profiles!.add(ProfileModel.fromJson(v));
      });
    }
  }
}
