import 'package:flutter/material.dart';
import 'package:meditation_app/home_screen/widgets/custom_app_bar.dart';
import 'package:meditation_app/home_screen/widgets/hero_image.dart';
import 'package:meditation_app/home_screen/widgets/music_item.dart';
import 'package:meditation_app/models/music.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final List<String> titles = [
  //   'Painting Forest ',
  //   'Mountaineers',
  //   'Lovely Deserts',
  //   'The Hill Sides',
  //   'Nature Canvas',
  //   'Mountain Majesty',
  //   'Desert Serenity',
  //   'Rolling Hills',
  //   'Wilderness Beauty',
  //   'Desert Landscapes'
  // ];
  final List<Music> relaxedMusic = [
    Music(
      title: 'Painting Forest ',
      duration: 20,
      imageNumber: 1,
    ),
    Music(
      title: 'Mountaineers',
      duration: 10,
      imageNumber: 2,
    ),
    Music(
      title: 'Lovely Deserts',
      duration: 30,
      imageNumber: 3,
    ),
    Music(
      title: 'The Hill Sides',
      duration: 40,
      imageNumber: 4,
    ),
    Music(
      title: 'Nature Canvas',
      duration: 30,
      imageNumber: 5,
    ),
    Music(
      title: 'Mountain Majesty',
      duration: 10,
      imageNumber: 6,
    ),
    Music(
      title: 'Desert Serenity',
      duration: 20,
      imageNumber: 7,
    ),
    Music(
      title: 'Rolling Hills',
      duration: 40,
      imageNumber: 8,
    ),
    Music(
      title: 'Wilderness Beauty',
      duration: 20,
      imageNumber: 9,
    ),
    Music(
      title: 'Desert Landscapes',
      duration: 20,
      imageNumber: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: kPadding16,
            horizontal: kPadding16,
          ),
          children: [
            // AppBar
            const CustomAppBar(),

            const SizedBox(
              height: kPadding30,
            ),

            // Hero Image
            const HeroImage(),
            const SizedBox(
              height: kPadding30,
            ),

            // List of Calm Music
            for (final item in relaxedMusic) MusicItem(music: item),
          ],
        ),
      ),
    );
  }
}
