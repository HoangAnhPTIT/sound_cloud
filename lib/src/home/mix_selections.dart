import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sound_cloud/models/collection.dart';
import 'package:http/http.dart' as http;

class MixSelection extends StatefulWidget {
  const MixSelection({super.key});

  @override
  State<MixSelection> createState() => _MixSelectionState();
}

class _MixSelectionState extends State<MixSelection> {
  late Future<List<Collection>> collections;

  Future<List<Collection>> fetchMixCollections() async {
    final response = await http.get(Uri.parse(
        'https://api-mobi.soundcloud.com/mixed-selections?meOrAnonymousUserUrn=soundcloud%3Ausers%3Aanonymous&app_locale=en&client_id=iZIs9mchVcX5lhVRyQGGAYlNPVldzAoX&stage='));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body)['collection'];

      List<Collection> collectionResponse =
          List<Collection>.from(l.map((model) => Collection.fromJson(model)));

      return collectionResponse.take(2).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    collections = fetchMixCollections();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Collection>>(
        future: collections,
        builder:
            (BuildContext context, AsyncSnapshot<List<Collection>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 12, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data!
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  e.description!.isNotEmpty
                                      ? e.description as String
                                      : "",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Color.fromRGBO(102, 102, 102, 0.8)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                height: 180.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: e.selectionItem.collectionItems
                                      .map((e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    6),
                                                            topRight:
                                                                Radius.circular(
                                                                    6),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    6),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    6)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 3,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 5.0,
                                                        sigmaY: 5.0,
                                                      ),
                                                      child: Image.network(
                                                        e.calculatedArtworkUrl
                                                            as String,
                                                        fit: BoxFit.fill,
                                                        width: 140,
                                                        height: 140,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6),
                                                  child: Text(
                                                    e.shortTitle as String,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Text(
                                                  e.shortDescription as String,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(
                                                          102, 102, 102, 0.8)),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              );
            }
          }
        });
  }
}
