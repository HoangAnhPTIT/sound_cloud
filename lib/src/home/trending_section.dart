import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sound_cloud/models/track.dart';

import '../../converters/converter.dart';

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
    const titleColor = Color.fromRGBO(102, 102, 102, 1);
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
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
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
                                            Text(e.title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 4),
                                              child: Text(e.user.username,
                                                  style: const TextStyle(
                                                      color: titleColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 3),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.34,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Icon(
                                                      Icons.play_arrow,
                                                      color: titleColor,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      ConvertPlaybackCount
                                                          .handler(
                                                              e.playbackCount),
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: titleColor),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: const Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                        color: titleColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      ConvertTrackDudations.formatedTime(
                                                          timeInSecond: Duration(
                                                                  milliseconds: e
                                                                      .duration
                                                                      .toInt())
                                                              .inSeconds
                                                              .toInt()),
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: titleColor),
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: const Icon(
                                                          Icons.circle,
                                                          size: 2,
                                                          color: titleColor),
                                                    ),
                                                    Text(
                                                      ConvertDateDiffToDynamicDate
                                                          .handler(DateTime
                                                                  .now()
                                                              .difference(
                                                                  DateTime.parse(
                                                                      e.lastModified))
                                                              .inDays),
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: titleColor),
                                                    )
                                                  ],
                                                ),
                                              ),
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
        Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          width: MediaQuery.of(context).size.width,
          child: const ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: null,
              child: Text(
                'Create a free account',
                style: TextStyle(color: Colors.white, fontSize: 14),
              )),
        )
      ],
    );
  }
}
