import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sound_cloud/src/home/mix_selections.dart';
import 'package:sound_cloud/src/home/trending_section.dart';

import 'body_attention.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/logo.svg';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 140,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(logoPath, semanticsLabel: 'A red up arrow'),
        ),
        actions: [
          const TextButton(
              onPressed: null,
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.black),
              )),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(right: 6),
            child: const ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              child: Text(
                'Listen in app',
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: const [BodyAttention(), TrendingSection(), MixSelection()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color.fromRGBO(102, 102, 102, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: const Color.fromRGBO(102, 102, 102, 1),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/feed.svg',
                  color: const Color.fromRGBO(102, 102, 102, 1),
                ),
                label: 'Feed'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: const Color.fromRGBO(102, 102, 102, 1),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/library.svg',
                  color: const Color.fromRGBO(102, 102, 102, 1),
                ),
                label: 'Library'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/download.svg',
                  color: const Color.fromRGBO(102, 102, 102, 1),
                ),
                label: 'Download'),
          ]),
    );
  }
}
