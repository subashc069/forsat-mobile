class Pagination {
  final int currentPage;
  final int lastpage;

  Pagination.fromJson(Map<String, dynamic> jsonMap)
      : currentPage = jsonMap['current_page'] ?? 0,
        lastpage = jsonMap['last_page'] ?? 0;
}
