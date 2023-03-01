// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
    json['artwork_url'] as String,
    json['title'] as String,
    Media.fromJson(json['media'] as Map<String, dynamic>),
    User.fromJson(json['user'] as Map<String, dynamic>),
    json['playback_count'] as num,
    json['duration'] as num);

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'artwork_url': instance.artworkUrl,
      'title': instance.title,
      'media': instance.media,
      'user': instance.user,
    };
