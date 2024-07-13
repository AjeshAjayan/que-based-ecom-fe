// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginated<T> _$PaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginated<T>(
      (json['docs'] as List<dynamic>).map(fromJsonT).toList(),
      (json['totalDocs'] as num).toInt(),
      (json['limit'] as num).toInt(),
      (json['page'] as num).toInt(),
      (json['pagingCounter'] as num).toInt(),
      json['hasNextPage'] as bool,
      json['hasPrevPage'] as bool,
      (json['totalPages'] as num).toInt(),
      json['prevPage'] as String?,
      json['nextPage'] as String?,
    );

Map<String, dynamic> _$PaginatedToJson<T>(
  Paginated<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'docs': instance.docs.map(toJsonT).toList(),
      'totalDocs': instance.totalDocs,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'pagingCounter': instance.pagingCounter,
      'hasNextPage': instance.hasNextPage,
      'hasPrevPage': instance.hasPrevPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };
