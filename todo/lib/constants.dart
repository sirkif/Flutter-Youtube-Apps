import 'package:flutter/material.dart';

const double kBorderRadius8 = 8;

const Color kGreyColor = Color(0xFF9495A5);
const Color kBlueColor = Color(0xFF397CFC);

// Dark Mode
const Color kDarkTextColor = Color(0xFFC8CBE7);
const Color kDarkPrimaryColor = Color(0xFF171823);
const Color kDarkSecondaryColor = Color(0xFF25273D);

const LinearGradient kDarkLinearGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFFA32394),
    Color(0xFF360FBC),
  ],
);

// Light Mode
const Color kLightTextColor = Color(0xFF494C6B);
const Color kLightPrimayColor = Colors.white70;
const Color kLightSecondaryColor = Colors.white;

const LinearGradient kLightLinearGradient = LinearGradient(
  begin: Alignment(-0.71, -0.71),
  end: Alignment(0.71, 0.71),
  colors: [
    Color(0xFF5495FF),
    Color(0xFFAC2DEA),
  ],
);
