import 'package:json_annotation/json_annotation.dart';

import 'transcoding.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  final List<Transcoding> transcodings;

  Media(this.transcodings);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
