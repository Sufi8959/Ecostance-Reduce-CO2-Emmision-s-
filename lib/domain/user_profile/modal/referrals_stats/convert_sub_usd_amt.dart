class ConvertSubUsdAmt {
  ConvertSubUsdAmt({
      this.inr,});

  ConvertSubUsdAmt.fromJson(dynamic json) {
    inr = json['INR'];
  }
  double? inr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['INR'] = inr;
    return map;
  }

}