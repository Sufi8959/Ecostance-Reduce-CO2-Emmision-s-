import 'package:json_annotation/json_annotation.dart';

part 'category_list.g.dart';

@JsonSerializable()
class CategoryList {
  String? category;
  String? subCategory;

  CategoryList({this.category, this.subCategory});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return _$CategoryListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
