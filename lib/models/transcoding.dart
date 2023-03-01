import 'package:json_annotation/json_annotation.dart';

import 'media_format.dart';

part 'transcoding.g.dart';

@JsonSerializable()
class Transcoding {
  final String url;
  final int duration;
  final String quality;
  final Format format;

  Transcoding(this.url, this.duration, this.quality, this.format);

  factory Transcoding.fromJson(Map<String, dynamic> json) =>
      _$TranscodingFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$TranscodingToJson(this);
}
