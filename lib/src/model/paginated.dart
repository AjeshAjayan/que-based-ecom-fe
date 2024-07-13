import 'package:json_annotation/json_annotation.dart';

part 'paginated.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {
  final List<T> docs;
  final int totalDocs, limit, totalPages, page, pagingCounter;
  final bool hasNextPage, hasPrevPage;
  final String? prevPage, nextPage;

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

  factory Paginated.fromJSON(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedFromJson(json, fromJsonT);

  Map<String, dynamic> toJSON(
          Paginated<T> instance, Object Function(T value) toJsonT) =>
      _$PaginatedToJson(instance, toJsonT);
}
