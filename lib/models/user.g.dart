// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['username'] as String,
      json['avatar_url'] as String,
      json['permalink_url'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'permalink_url': instance.permalinkUrl,
    };