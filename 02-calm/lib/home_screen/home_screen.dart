import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets/hero_image.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/sound_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> soundsName = [
    'Painting Forest ',
    'Mountaineers',
    'Lovely Deserts',
    'The Hill Sides',
    'Nature Canvas',
    'Mountain Majesty',
    'Desert Serenity',
    'Rolling Hills',
    'Wilderness Beauty',
    'Desert Landscapes'
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
            const HomeAppBar(),

            const SizedBox(
              height: kPadding30,
            ),

            // Hero Image
            const HeroImage(),
            const SizedBox(
              height: kPadding30,
            ),

            // List Sounds
            for (int index = 0; index < soundsName.length; index++)
              SoundItem(
                  soundName: soundsName[index],
                  imageNumber: index + 1,
                  duration: Random().nextInt(30) + 10)
          ],
        ),
      ),
    );
  }
}
