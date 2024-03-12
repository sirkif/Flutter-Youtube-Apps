import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.padHorizontal,
      required this.onPressed});
  final String text;
  final double padHorizontal;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: padHorizontal,
          vertical: 12,
        ),
        backgroundColor: const Color(0xffE85F4C),
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}
