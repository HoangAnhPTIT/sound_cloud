// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcoding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transcoding _$TranscodingFromJson(Map<String, dynamic> json) => Transcoding(
      json['url'] as String,
      json['duration'] as int,
      json['quality'] as String,
      Format.fromJson(json['format'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TranscodingToJson(Transcoding instance) =>
    <String, dynamic>{
      'url': instance.url,
      'duration': instance.duration,
      'quality': instance.quality,
      'format': instance.format,
    };
