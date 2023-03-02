// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionItem _$CollectionItemFromJson(Map<String, dynamic> json) =>
    CollectionItem(
      json['calculated_artwork_url'] as String?,
      json['short_title'] as String?,
      json['short_description'] as String?,
    );

Map<String, dynamic> _$CollectionItemToJson(CollectionItem instance) =>
    <String, dynamic>{
      'calculated_artwork_url': instance.calculatedArtworkUrl,
      'short_title': instance.shortTitle,
      'short_description': instance.shortDescription,
    };
