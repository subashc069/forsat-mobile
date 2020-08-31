class Country {
  final int id;
  final String name;
  final String phoneCode;
  final String countryCode;

  Country.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? "",
        phoneCode = jsonMap['phoneCode'] ?? "",
        countryCode = jsonMap['countryCode'] ?? "";
}
