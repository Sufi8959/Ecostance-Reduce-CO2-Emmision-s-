class ConvertUsdAmt {
  ConvertUsdAmt({
      this.inr,});

  ConvertUsdAmt.fromJson(dynamic json) {
    inr = json['INR'];
  }
  double? inr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INR'] = inr;
    return map;
  }

}