class DeleteAccountRequest {
  DeleteAccountRequest({
      this.email, 
      this.newsLetterSubscribe,});

  DeleteAccountRequest.fromJson(dynamic json) {
    email = json['email'];
    newsLetterSubscribe = json['newsLetterSubscribe'];
  }
  String? email;
  bool? newsLetterSubscribe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['newsLetterSubscribe'] = newsLetterSubscribe;
    return map;
  }

}