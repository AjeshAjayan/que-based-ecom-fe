abstract class JSON {
  Map<String, dynamic> toJSON();
}

class Paginated<T extends JSON> {
  final List<T> docs;
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasNextPage;
  final bool hasPrevPage;
  final String? prevPage;
  final String? nextPage;

  Paginated(
    this.docs,
    this.totalDocs,
    this.limit,
    this.page,
    this.pagingCounter,
    this.hasNextPage,
    this.hasPrevPage,
    this.totalPages,
    this.prevPage,
    this.nextPage,
  );

  Paginated.fromJSON(Map<String, dynamic> json)
      : docs = json['docs'].map((d) => (T as dynamic).fromJSON(d)) as List<T>,
        totalDocs = json['totalDocs'] as int,
        limit = json['limit'] as int,
        page = json['page'] as int,
        pagingCounter = json['pagingCounter'] as int,
        hasNextPage = json['hasNextPage'] as bool,
        hasPrevPage = json['hasPrevPage'] as bool,
        totalPages = json['totalPages'] as int,
        prevPage = json['prevPage'] as String?,
        nextPage = json['nextPage'] as String?;

  Map<String, dynamic> toJSON() {
    if ((docs as dynamic).toJSON == null) {
      throw 'Generic object must have toJSON as a method';
    }

    return {
      'docs': docs.map((d) => d.toJSON()).toList(),
      'totalDocs': totalDocs,
      'limit': limit,
      'page': page,
      'pagingCounter': pagingCounter,
      'hasNextPage': hasNextPage,
      'hasPrevPage': hasPrevPage,
      'totalPages': totalPages,
      'prevPage': prevPage,
      'nextPage': nextPage,
    };
  }
}

class Product extends JSON {
  final String title;

  Product(this.title);

  Product.fromJSON(Map<String, dynamic> json) : title = json["title"] as String;

  @override
  Map<String, dynamic> toJSON() {
    return {
      'title': title,
    };
  }
}
