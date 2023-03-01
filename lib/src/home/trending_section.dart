import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sound_cloud/models/track.dart';

import '../../converters/convert_playback_count.dart';

class TrendingSection extends StatefulWidget {
  const TrendingSection({super.key});

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  late Future<List<Track>> tracks;

  Future<List<Track>> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://api-v2.soundcloud.com/featured_tracks/top/all-music?client_id=oVn8FWS0SSZLzGf4H89ll7Pchy3DoZ9i&limit=4&offset=0&linked_partitioning=1&app_version=1677489058&app_locale=en'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body)['collection'];

      List<Track> trackResponse =
          List<Track>.from(l.map((model) => Track.fromJson(model)));

      return trackResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    tracks = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Trending tracks on SoundCloud',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        FutureBuilder<List<Track>>(
          future: tracks,
          builder: (BuildContext context, AsyncSnapshot<List<Track>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Please wait its loading...'));
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: snapshot.data!
                          .map((e) => Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  children: [
                                    Image.network(e.artworkUrl),
                                    Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.title,
                                            ),
                                            Text(e.user.username),
                                            Row(
                                              children: [
                                                const Icon(Icons.play_arrow),
                                                Text(ConvertPlaybackCount
                                                    .handler(e.playbackCount)),
                                                const Icon(
                                                  Icons.circle,
                                                  size: 3,
                                                ),
                                                // Text((TimeUnit.MILLISECONDS.toMinutes(millis))
                                              ],
                                            )
                                          ]),
                                    )
                                  ],
                                ),
                              ))
                          .toList()),
                ); // snapshot.data  :- get your object which is pass from your downloadData() function
              }
            }
          },
        ),
      ],
    );
  }
}
