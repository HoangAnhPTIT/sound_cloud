import 'media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  @JsonKey(name: 'artwork_url')
  final String artworkUrl;
  final String title;
  final Media media;

  Track(this.artworkUrl, this.title, this.media);

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
