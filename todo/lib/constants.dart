import 'package:flutter/material.dart';

// Padding
const double kPadding8 = 8;
const double kPadding16 = 16;
const double kPadding24 = 24;
const double kPadding32 = 32;
const double kPadding64 = 64;

// Border Radius
const double kBorderRadius8 = 8;

// General Color
const Color kColorBlack87 = Colors.black87;
const Color kColorGrey = Color(0xFF9495A5);
const Color kColorBlue = Color(0xFF397CFC);

// Dark Mode
const Color kDarkTextColor = Color(0xFFC8CBE7);
const Color kDarkPrimaryColor = Color(0xFF171823);

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

const LinearGradient kLightLinearGradient = LinearGradient(
  begin: Alignment(-0.71, -0.71),
  end: Alignment(0.71, 0.71),
  colors: [
    Color(0xFF5495FF),
    Color(0xFFAC2DEA),
  ],
);
