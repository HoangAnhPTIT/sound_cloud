import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;

  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @JsonKey(name: 'permalink_url')
  final String permalinkUrl;

  User(this.username, this.avatarUrl, this.permalinkUrl);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
