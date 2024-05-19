
class Template {
  final int id;
  final String displayName;
  final String name;
  final String link;
  bool isChecked;

  Template({
    required this.id,
    required this.displayName,
    required this.name,
    required this.link,
    this.isChecked = false
  });
}