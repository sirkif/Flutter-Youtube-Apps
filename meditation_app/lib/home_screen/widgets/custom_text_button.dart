import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../constants.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({super.key});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isPlaying = false;

  final AudioPlayer audioPlayer = AudioPlayer();

  void onPlay() {
    audioPlayer.setAudioSource(
      AudioSource.asset(kMusicName),
    );
    if (isPlaying) {
      audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
    } else {
      audioPlayer.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
      onPressed: () {
        onPlay();
      },
      icon: Icon(
        isPlaying ? Icons.stop : Icons.play_arrow,
        color: kBlackColor,
      ),
      label: Text(
        isPlaying ? 'stop' : "play",
        style: const TextStyle(
          color: kBlackColor,
        ),
      ),
    );
  }
}
