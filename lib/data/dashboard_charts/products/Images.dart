class Images {
  Images({
      this.link, 
      this.size,});

  Images.fromJson(dynamic json) {
    link = json['link'];
    size = json['size'];
  }
  String? link;
  String? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = link;
    map['size'] = size;
    return map;
  }

}