import 'package:squadio_test/model/pooular_persons/person_model.dart';

class PopularPersonModel {
  num? page;
  List<PersonModel>? results;
  num? totalPages;
  num? totalResults;

  PopularPersonModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularPersonModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <PersonModel>[];
      json['results'].forEach((v) {
        results!.add(PersonModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
