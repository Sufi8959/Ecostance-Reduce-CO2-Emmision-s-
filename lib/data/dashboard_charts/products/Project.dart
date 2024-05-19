class Project {
  Project({
      this.exchange, 
      this.scale, 
      this.id, 
      this.link, 
      this.participants, 
      this.size, 
      this.start, 
      this.completion, 
      this.validator, 
      this.validatorLink, 
      this.monitor, 
      this.monitorNotes, 
      this.monitorLink, 
      this.auditor, 
      this.information, 
      this.owners, 
      this.developers, 
      this.funders, 
      this.validatorCity, 
      this.validatorCountry, 
      this.validatorState,});

  Project.fromJson(dynamic json) {
    exchange = json['exchange'];
    scale = json['scale'];
    id = json['id'];
    link = json['link'];
    participants = json['participants'];
    size = json['size'];
    start = json['start'];
    completion = json['completion'];
    validator = json['validator'];
    validatorLink = json['validatorLink'];
    monitor = json['monitor'];
    monitorNotes = json['monitorNotes'];
    monitorLink = json['monitorLink'];
    // if (json['auditor'] != null) {
    //   auditor = [];
    //   json['auditor'].forEach((v) {
    //     auditor?.add(Dynamic.fromJson(v));
    //   });
    // }
    information = json['information'];
    owners = json['owners'] != null ? json['owners'].cast<String>() : [];
    developers = json['developers'];
    funders = json['funders'];
    validatorCity = json['validatorCity'];
    validatorCountry = json['validatorCountry'];
    validatorState = json['validatorState'];
  }
  String? exchange;
  String? scale;
  String? id;
  String? link;
  String? participants;
  String? size;
  String? start;
  String? completion;
  String? validator;
  String? validatorLink;
  String? monitor;
  String? monitorNotes;
  String? monitorLink;
  List<dynamic>? auditor;
  String? information;
  List<String>? owners;
  String? developers;
  String? funders;
  String? validatorCity;
  String? validatorCountry;
  String? validatorState;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exchange'] = exchange;
    map['scale'] = scale;
    map['id'] = id;
    map['link'] = link;
    map['participants'] = participants;
    map['size'] = size;
    map['start'] = start;
    map['completion'] = completion;
    map['validator'] = validator;
    map['validatorLink'] = validatorLink;
    map['monitor'] = monitor;
    map['monitorNotes'] = monitorNotes;
    map['monitorLink'] = monitorLink;
    if (auditor != null) {
      map['auditor'] = auditor?.map((v) => v.toJson()).toList();
    }
    map['information'] = information;
    map['owners'] = owners;
    map['developers'] = developers;
    map['funders'] = funders;
    map['validatorCity'] = validatorCity;
    map['validatorCountry'] = validatorCountry;
    map['validatorState'] = validatorState;
    return map;
  }

}