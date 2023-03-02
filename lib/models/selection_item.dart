import 'package:json_annotation/json_annotation.dart';
import 'package:sound_cloud/models/collection_item.dart';

part 'selection_item.g.dart';

@JsonSerializable()
class SelectionItem {
  @JsonKey(name: 'collection')
  final List<CollectionItem> collectionItems;

  SelectionItem(this.collectionItems);

  factory SelectionItem.fromJson(Map<String, dynamic> json) =>
      _$SelectionItemFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$SelectionItemToJson(this);
}
