import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/home_products/responses/product_list/project.dart';

import 'location.dart';
import 'sdg.dart';
import 'std_method.dart';
import '../../../home_products/responses/product_list/document.dart';
part 'details.g.dart';

@JsonSerializable()
class FetchOrderProductDetailsResponse {
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

  FetchOrderProductDetailsResponse({
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

  factory FetchOrderProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$FetchOrderProductDetailsResponseFromJson(json);
  }
}
