import 'package:json_annotation/json_annotation.dart';

part 'media_format.g.dart';

@JsonSerializable()
class Format {
  final String protocol;

  @JsonKey(name: 'mime_type')
  final String mineType;

  Format(this.protocol, this.mineType);

  factory Format.fromJson(Map<String, dynamic> json) => _$FormatFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$FormatToJson(this);
}
