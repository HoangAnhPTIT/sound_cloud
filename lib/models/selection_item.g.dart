// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectionItem _$SelectionItemFromJson(Map<String, dynamic> json) =>
    SelectionItem(
      (json['collection'] as List<dynamic>)
          .map((e) => CollectionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelectionItemToJson(SelectionItem instance) =>
    <String, dynamic>{
      'collection': instance.collectionItems,
    };
