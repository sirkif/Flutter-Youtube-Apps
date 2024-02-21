import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(children: [
        const FadeInImage(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          placeholder: AssetImage("assets/images/circular_progress.gif"),
          image: NetworkImage(
            'https://i.makeagif.com/media/2-13-2023/817deL.gif',
          ),
        ),
        Positioned.fill(
          child: Container(
            color: const Color.fromRGBO(
              0,
              0,
              0,
              0.1,
            ),
          ),
        ),
        Positioned(
          top: 32,
          left: 32,
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Relax Sounds",
                style: TextStyle(
                  color: Color.fromRGBO(
                    255,
                    255,
                    255,
                    0.95,
                  ),
                  fontFamily: "Alegreya",
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
              Opacity(
                opacity: 0.9,
                child: Text(
                  "Sometimes the most productive thing you can do is relax.",
                  maxLines: 2,
                  style: GoogleFonts.alegreyaSans(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
