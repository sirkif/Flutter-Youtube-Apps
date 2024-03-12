import 'package:flutter/material.dart';

// Padding
const double kPadding8 = 8;
const double kPadding16 = 16;
const double kPadding24 = 24;
const double kPadding32 = 32;
const double kPadding64 = 64;

// Border Radius
const double kBorderRadius8 = 8;

// Primary Color
const Color kPrimaryColor = Color(0xFF171823);

// Dark Mode
const LinearGradient kDarkLinearGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFFA32394),
    Color(0xFF360FBC),
  ],
);

// Light Mode
const LinearGradient kLightLinearGradient = LinearGradient(
  begin: Alignment(-0.71, -0.71),
  end: Alignment(0.71, 0.71),
  colors: [
    Color(0xFF5495FF),
    Color(0xFFAC2DEA),
  ],
);
