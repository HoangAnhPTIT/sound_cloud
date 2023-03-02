// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      json['title'] as String,
      json['description'] as String?,
      SelectionItem.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'items': instance.selectionItem,
    };
