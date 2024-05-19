import 'Project.dart';

class Details {
  Details({
      this.project, 
      this.estimatedAnnualEmissionReduction,
      this.creditsIssued, 
      this.operationRegistration, 
      this.termStart, 
      this.termEnd, 
      this.landArea,
      this.coBenifitsDescription,});

  Details.fromJson(dynamic json) {
    project = json['project'] != null ? Project.fromJson(json['project']) : null;
    estimatedAnnualEmissionReduction = json['estimatedAnnualEmissionReduction'];
    creditsIssued = json['creditsIssued'];
    operationRegistration = json['operationRegistration'];
    termStart = json['termStart'];
    termEnd = json['termEnd'];
    landArea = json['landArea'];
    coBenifitsDescription = json['coBenifitsDescription'];
  }
  Project? project;
  String? estimatedAnnualEmissionReduction;
  String? creditsIssued;
  String? operationRegistration;
  String? termStart;
  String? termEnd;
  String? landArea;
  String? coBenifitsDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (project != null) {
      map['project'] = project?.toJson();
    }
    map['estimatedAnnualEmissionReduction'] = estimatedAnnualEmissionReduction;
    map['creditsIssued'] = creditsIssued;
    map['operationRegistration'] = operationRegistration;
    map['termStart'] = termStart;
    map['termEnd'] = termEnd;
    map['landArea'] = landArea;
    map['coBenifitsDescription'] = coBenifitsDescription;
    return map;
  }

}