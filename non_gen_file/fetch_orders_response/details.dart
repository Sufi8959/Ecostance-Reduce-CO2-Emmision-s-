import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'project.dart';
import 'sdg.dart';
import 'std_method.dart';
import 'package:net_carbons/data/home_products/responses/product_list/document.dart';
part 'details.g.dart';

@JsonSerializable()
class Details {
  Project? project;
  List<Sdg>? sdgs;
  List<String>? standards;
  StdMethod? stdMethod;
  String? estimatedAnnualEmissionReduction;
  String? creditsIssued;
  DateTime? operationRegistration;
  DateTime? termStart;
  DateTime? termEnd;
  List<Location>? location;
  String? landArea;
  String? coBenifitsDescription;
  List<Document>? documents;

  Details({
    this.project,
    this.sdgs,
    this.standards,
    this.stdMethod,
    this.estimatedAnnualEmissionReduction,
    this.creditsIssued,
    this.operationRegistration,
    this.termStart,
    this.termEnd,
    this.location,
    this.landArea,
    this.coBenifitsDescription,
    this.documents,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return _$DetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
