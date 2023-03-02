import 'package:json_annotation/json_annotation.dart';
import 'package:sound_cloud/models/selection_item.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  final String title;
  final String? description;

  @JsonKey(name: 'items')
  final SelectionItem selectionItem;

  Collection(this.title, this.description, this.selectionItem);

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
