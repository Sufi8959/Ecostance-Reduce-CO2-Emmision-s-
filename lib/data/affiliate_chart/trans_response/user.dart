class User {
  User({
      this.id, 
      this.email,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
  }
  String? id;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    return map;
  }

}