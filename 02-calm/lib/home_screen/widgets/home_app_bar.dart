import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          kHamburgerIcon,
          semanticsLabel: "hamburger icon",
          height: 20,
        ),
        Image.asset(
          kLogoImage,
        ),
        const CircleAvatar(
          radius: 20, // Image radius
          backgroundImage: AssetImage(
            kProfileImage,
          ),
        )
      ],
    );
  }
}
