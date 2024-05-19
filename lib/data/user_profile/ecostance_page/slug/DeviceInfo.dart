class DeviceInfo {
  DeviceInfo({
      this.ua, 
      this.ip,});

  DeviceInfo.fromJson(dynamic json) {
    ua = json['ua'];
    ip = json['ip'];
  }
  String? ua;
  String? ip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ua'] = ua;
    map['ip'] = ip;
    return map;
  }

}