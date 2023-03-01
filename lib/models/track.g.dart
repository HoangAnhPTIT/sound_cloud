// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      json['artwork_url'] as String,
      json['title'] as String,
      Media.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'artwork_url': instance.artworkUrl,
      'title': instance.title,
      'media': instance.media,
    };
