import 'package:json_annotation/json_annotation.dart';
part 'collection_item.g.dart';

@JsonSerializable()
class CollectionItem {
  @JsonKey(name: 'calculated_artwork_url')
  final String? calculatedArtworkUrl;

  @JsonKey(name: 'short_title')
  final String? shortTitle;

  @JsonKey(name: 'short_description')
  final String? shortDescription;

  CollectionItem(
      this.calculatedArtworkUrl, this.shortTitle, this.shortDescription);

  factory CollectionItem.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$CollectionItemToJson(this);
}
