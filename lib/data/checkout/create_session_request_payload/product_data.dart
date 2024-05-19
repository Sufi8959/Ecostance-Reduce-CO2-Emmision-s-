import 'package:json_annotation/json_annotation.dart';

part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  String? name;
  List<String>? images;

  ProductData({this.name, this.images});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return _$ProductDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
