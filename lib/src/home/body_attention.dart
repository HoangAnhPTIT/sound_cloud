import 'package:flutter/material.dart';

class BodyAttention extends StatelessWidget {
  const BodyAttention({super.key});

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.9;

    return Stack(
      children: [
        Image.asset('assets/images/home-page-featured-artists-hero-image.jpg'),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 16, bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: cWidth,
                    child: const Text(
                      'What\'s next in music is first on SoundCloud',
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: cWidth,
                    child: const ElevatedButton(
                        style: ButtonStyle(

                            // padding: MaterialStatePropertyAll(
                            //     EdgeInsets.only(
                            //         left: cWidth / 4, right: cWidth / 4)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: null,
                        child: Text(
                          'Create a free account',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
