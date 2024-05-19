class TotalAmt {
  TotalAmt({
      this.inr,});

  TotalAmt.fromJson(dynamic json) {
    inr = json['INR'];
  }
  int? inr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INR'] = inr;
    return map;
  }

}