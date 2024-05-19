class Metadata {
  Metadata({
      this.total, 
      this.totalPages, 
      this.currentPage, 
      this.nextPage,});

  Metadata.fromJson(dynamic json) {
    total = json['total'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
    nextPage = json['nextPage'];
  }
  int? total;
  int? totalPages;
  int? currentPage;
  dynamic nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['totalPages'] = totalPages;
    map['currentPage'] = currentPage;
    map['nextPage'] = nextPage;
    return map;
  }

}