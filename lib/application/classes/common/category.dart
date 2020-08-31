class Category {
  final int id;
  final String name;
  Category.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? '';
}
